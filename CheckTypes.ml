open Types
open Symbol
open Extend
open Error
open Ast
open Format
open PrintErrors

let note_by_ref par expr =
 match par.entry_info with
 | ENTRY_parameter (par_info) ->
 begin
   match par_info.parameter_mode, par_info.parameter_type with
   | PASS_BY_REFERENCE, _  ->
   begin
     match expr.expr_info with
     | E_atom (atom) ->
      begin
       match atom.atom_info with
       | A_call (a) -> invalid_expr_byref expr.expr_error_pos;
       | A_string (a) -> invalid_expr_byref expr.expr_error_pos;
       | _ -> atom.atom_callbyref <- true
      end
     | E_head (h_expr) -> expr.expr_callbyref <- true
     | E_tail (t_expr) -> expr.expr_callbyref <- true
     | _ -> invalid_expr_byref expr.expr_error_pos;
   end
   | PASS_BY_VALUE, _ -> ()
 end
 | _ -> ()


(* Gets an entry
   Returns an Types.typ  *)
let get_entry_type entry =
  match entry.entry_info with
  | ENTRY_variable  (var_info) -> var_info.variable_type
  | ENTRY_parameter (par_info) -> par_info.parameter_type
  | ENTRY_temporary (temp_info)-> temp_info.temporary_type
  | ENTRY_function  (func_info)-> func_info.function_result


(* Returns the dimension of an ARRAY Entry*)
let get_entry_dimension entry  =
  let entry_type = get_entry_type (entry) in
  let rec aux e_type cnt =
    match e_type with
    | TYPE_array (t,_) -> aux t (cnt+1)
    | _ -> cnt
  in
  aux entry_type 0

(*Returns the type of atom, based on its entry*)
let rec get_atom_type atom entry_type  =
  match atom,  entry_type with
  | A_structure (stru_atom, _), TYPE_array (t,_) -> get_atom_type (stru_atom.atom_info) (t)
  | _, t                                         -> t

let get_expr_type expr entry_type =
  match expr, entry_type with
  | E_atom (atom), t -> get_atom_type (atom.atom_info) (t)
  | _, t             -> t






let check_type_assignment (atom) (atom_entry) (expr) (expr_entry) (startpos, endpos) =
  (*check if this atom can be lvalue*)
  match atom.atom_info with
  | A_call _ -> lvalue_error_call (startpos, endpos)
  | A_string _ -> lvalue_error_string (startpos, endpos)
  | _ -> (

            let atom_entry_type = get_entry_type atom_entry in
            let expr_entry_type = get_entry_type expr_entry in
            let atom_type = get_atom_type (atom.atom_info) (atom_entry_type) in
            (begin
              match expr.expr_info with
              | E_nil ->  ignore(expr.expr_type <- atom_type)
              | _ -> ()
            end);
            let expr_type = get_expr_type (expr.expr_info) (expr_entry_type) in
              if(equalType (atom_type) (expr_type) = false) then
                assignment_error atom_type expr_type (startpos, endpos)
              else if expr_entry_type = TYPE_array(TYPE_char, -42) then
                string_assignment_error (startpos, endpos)

          )







(* check parameters types of a function call, gets both a LIST ENTRIES *)
and check_parameters (call_entry, expr_list, entry_list) (startpos, endpos) =
  match call_entry.entry_info with
  | ENTRY_function (func_info) ->

    let param_list_entry = func_info.function_paramlist in

    let rec check_par_aux (param_list_entry) (expr_list) (entry_list) (startpos, endpos) =
      match param_list_entry, expr_list, entry_list with
      | [],  [x], _ ->
          many_arguments (startpos,endpos)
      | [], (expr::exprs), _ ->
          many_arguments (startpos,endpos)
      | [x], [],  _ ->
          few_arguments (startpos,endpos)
      | (par::pars), [], _ ->
          few_arguments (startpos,endpos)
      | [],  [],  _ -> ()

      | (par::pars), (expr::exprs), (entry::entries) ->
        ignore(note_by_ref par expr);
        let par_type = get_entry_type par in
        let expr_entry_type =  (get_entry_type entry) in
        let expr_type = get_expr_type (expr.expr_info) (expr_entry_type) in
        (begin
          match expr.expr_info with
          | E_nil -> ignore(expr.expr_type <- par_type)
          | _ -> ()
        end);
        if (equalType par_type expr_type = false) then
          parameter_type_error par_type expr_type  expr.expr_error_pos
        else check_par_aux pars exprs entries (startpos, endpos)
    in

    check_par_aux (param_list_entry) (expr_list) (entry_list)  (startpos, endpos)

and check_return_type (expr, expr_entry, result_type) =
  let expr_entry_type = get_entry_type expr_entry in
  let expr_type = get_expr_type (expr.expr_info) (expr_entry_type) in
  if(equalType (expr_type) (result_type) = false) then
    return_type_error result_type expr_type expr.expr_error_pos

(*if/for condition has to be BOOL TYPE*)
and check_cond_exp (cond_expr, cond_entry) =
  let cond_entry_type = get_entry_type cond_entry in
  let cond_expr_type = get_expr_type (cond_expr.expr_info) (cond_entry_type) in
  if (cond_expr_type <> TYPE_bool) then
    bool_expr_error cond_expr_type cond_expr.expr_error_pos


(* lvalue type == rvalue type == ΙΝΤ *)
and check_binary_exp (expr1, expr1_entry, expr2, expr2_entry) =
  let expr1_entry_type =  (get_entry_type expr1_entry) in
  let expr2_entry_type =  (get_entry_type expr2_entry) in
  let expr1_type = get_expr_type (expr1.expr_info) (expr1_entry_type) in
  let expr2_type = get_expr_type (expr2.expr_info) (expr2_entry_type) in
    if (equalType expr1_type TYPE_int = false) then
      int_expr_error expr1_type expr1.expr_error_pos
    else if (equalType expr2_type TYPE_int = false) then
      int_expr_error expr2_type expr2.expr_error_pos
    else ()


(* lvalue type == rvalue type == BOOL *)
and check_bool_exp (expr1, expr1_entry, expr2, expr2_entry) =
  let expr1_entry_type =  (get_entry_type expr1_entry) in
  let expr2_entry_type =  (get_entry_type expr2_entry) in
  let expr1_type = get_expr_type (expr1.expr_info) (expr1_entry_type) in
  let expr2_type = get_expr_type (expr2.expr_info) (expr2_entry_type) in
    if(equalType expr1_type TYPE_bool = false) then
      bool_expr_error expr1_type expr1.expr_error_pos
    else if (equalType expr2_type TYPE_bool = false) then
      bool_expr_error expr2_type expr2.expr_error_pos
    else ()

(* lvalue type == rvalue type == BOOL / INT / CHAR *)
and check_compare_exp (expr1, expr1_entry, expr2, expr2_entry) =
  let expr1_entry_type =  (get_entry_type expr1_entry) in
  let expr2_entry_type =  (get_entry_type expr2_entry) in
  let expr1_type = get_expr_type (expr1.expr_info) (expr1_entry_type) in
  let expr2_type = get_expr_type (expr2.expr_info) (expr2_entry_type) in
    if(equalType expr1_type expr2_type = true) then
      match expr1_type with
      | TYPE_array (_,_) ->
          compare_expr_error "Array" expr1.expr_error_pos

      | TYPE_list  (_) ->
          compare_expr_error "List" expr1.expr_error_pos

      | _ -> ()
    else
      compare_type_mismatch expr1.expr_error_pos

(*Based on the operator*)
and check_unary_exp (oper) (expr, expr_entry) =
  let expr_entry_type =  (get_entry_type expr_entry) in
  let expr_type = get_expr_type (expr.expr_info) (expr_entry_type) in
  match oper with
  | O_not ->
      if (equalType expr_type TYPE_bool = false) then
        bool_expr_error expr_type expr.expr_error_pos

  | O_minus ->
      if (equalType expr_type TYPE_int  = false) then
        int_expr_error expr_type expr.expr_error_pos

  | O_plus ->
      if (equalType expr_type TYPE_int  = false) then
        int_expr_error expr_type expr.expr_error_pos


(*The new_expr_entry HAS to be INT*)
and check_new_type (new_type, expr, expr_entry) =
  let expr_entry_type =  (get_entry_type expr_entry) in
  let expr_type = get_expr_type (expr.expr_info) (expr_entry_type) in
    if (equalType expr_type TYPE_int  = false) then
      new_type_error expr_type expr.expr_error_pos

and check_head_list (head_expr, head_entry) =
  let head_entry_type = (get_entry_type head_entry) in
  let head_expr_type  = get_expr_type (head_expr.expr_info) (head_entry_type) in
  match head_expr_type with
  | TYPE_list (t) -> t
  | _ ->
    (head_list_type_error head_expr_type head_expr.expr_error_pos;
     head_expr_type)

and check_tail_list (tail_expr, tail_entry)  =
  let tail_entry_type = (get_entry_type tail_entry) in
  let tail_expr_type  = get_expr_type (tail_expr.expr_info) (tail_entry_type) in
  match tail_expr_type with
  | TYPE_list (_) -> tail_entry_type
  | _ ->
    (tail_list_type_error tail_expr_type tail_expr.expr_error_pos;
     tail_entry_type)

(*Is the CONS operator
  left_value TYPE == List TYPE*)
and check_hashtag (expr1, expr1_entry, expr2, expr2_entry) =
  let expr1_entry_type =  (get_entry_type expr1_entry) in
  let expr2_entry_type =  (get_entry_type expr2_entry) in
  let expr1_type = get_expr_type (expr1.expr_info) (expr1_entry_type) in
  let expr2_type = get_expr_type (expr2.expr_info) (expr2_entry_type) in
  expr1.expr_type <- expr1_type;
  expr2.expr_type <- expr2_type;
  match expr2_type with
  | TYPE_list list_type ->
    if (equalType expr1_type list_type = false) then
      (hashtag_content_type_error expr1_type list_type expr1.expr_error_pos;
       expr2_type)

    else expr2_type
  | _ ->
    (hashtag_type_error expr2_type expr2.expr_error_pos;
     expr2_type)
