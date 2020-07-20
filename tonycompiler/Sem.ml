open Ast
open Symbtest
open Symbol
open Types
open CheckTypes
open Identifier
open Format
open PrintErrors

exception TypeError
exception Terminate

let rec typeToString t = match t with
  | TYPE_none         -> "no type"
  | TYPE_int          -> "int"
  | TYPE_bool         -> "bool"
  | TYPE_char         -> "char"
  | TYPE_array (t, _) -> String.concat " " [(typeToString t); "array"]
  | TYPE_list t       -> String.concat " " [(typeToString t); "list"]

(*this is used mostly for the library functions*)
let function_declare func_name func_type params_list =

  let rec add_params p_list func_entry =
    match p_list with
    | [] -> ()
    | ((par_name, par_type)::rest) ->

      (*Printf.printf "%s -> %s\n" par_name (typeToString par_type);*)
      ignore(newParameter (id_make par_name) par_type PASS_BY_VALUE func_entry true);
      add_params rest func_entry
  in
  let func_entry = newFunction (id_make func_name) true in
  (
    openScope();
    (*Printf.printf "%s\n" func_name;*)
    add_params params_list func_entry;
    forwardFunction func_entry;
    functionHeaderEnd (func_entry) (func_type);
    closeScope();
  )

let library_functions () =

  ignore(function_declare "puti" TYPE_none (("n", TYPE_int)::[]) );

  ignore(function_declare "putb" TYPE_none (("b", TYPE_bool)::[]) );
  ignore(function_declare "putc" TYPE_none (("c", TYPE_char)::[]) );
  ignore(function_declare "puts" TYPE_none (("s", TYPE_array(TYPE_char,0))::[]) );

  ignore(function_declare "geti" TYPE_int ([]) );
  ignore(function_declare "getb" TYPE_bool ([]) );
  ignore(function_declare "getc" TYPE_char ([]) );
  ignore(function_declare "gets" TYPE_none (("n1", TYPE_int)::("s", TYPE_array(TYPE_char,0))::[]) );

  ignore(function_declare "abs" TYPE_int (("n2", TYPE_int)::[]) );
  ignore(function_declare "ord" TYPE_int (("c", TYPE_char)::[]) );
  ignore(function_declare "chr" TYPE_char (("n", TYPE_int)::[]) );

  ignore(function_declare "strlen" TYPE_int (("s", TYPE_array(TYPE_char,0))::[]) );
  ignore(function_declare "strcmp" TYPE_int (("s2", TYPE_array(TYPE_char,0))::("s1", TYPE_array(TYPE_char,0))::[]) );
  ignore(function_declare "strcpy" TYPE_none (("src", TYPE_array(TYPE_char,0))::("trg", TYPE_array(TYPE_char,0))::[]) );
  ignore(function_declare "strcat" TYPE_none (("src", TYPE_array(TYPE_char,0))::("trg", TYPE_array(TYPE_char,0))::[]) );
;;

let rec sem_ast ast_tree =
  force_newline ();
  printf "****** SEM ANALYSIS *******";
  force_newline ();
  sem_maybe_program ast_tree;
  force_newline ()

and sem_maybe_program ast_tree =
  match ast_tree with
  | None ->
    eprintf "%s@." "AST IS EMPTY"
  | Some tree ->
    sem_program tree

and sem_program ast_tree =
  initSymbolTable 256;
  printSymbolTable ();

  library_functions();

  openScope();
  sem_fun_def ast_tree;
  closeScope()

and func_name header =
  match header.header_info with
  |  FunHeader (_, x, _) -> x

(* na tsekaroume an to frame size einai swsto *)
and sem_fun_def ast =
  match ast with
  | Fundef (header, inside_fun_list, stmts) ->
    let func_entry = sem_fun_header header in
    sem_inside_fun_list inside_fun_list func_entry;
    sem_stmts  (stmts) (func_name header);
    Printf.printf "I'M CLOSING SCOPE RIGHT NOW\n";
    header.var_type_list <-
      (
        match func_entry.entry_info with
        | ENTRY_function  function_info -> function_info.var_type_list
        | _ -> Printf.printf "doesn't exist\n"; raise TypeError

      );

    closeScope();
    printSymbolTable()

(*we will use header position after newFunction with TRY WITH*)
and sem_fun_header header =
  match header.header_info with
  | FunHeader (func_type, name, formal_defs) ->
    let func_entry = newFunction (id_make name) true in
    openScope();
    sem_formal_defs (func_entry) (func_type) (formal_defs);
    printSymbolTable ();
    func_entry

and sem_formal_defs func_entry func_type formal_defs =
  match formal_defs with
  | [] ->
    functionHeaderEnd (func_entry) (func_type);
  | (same_type_defs::rest) ->
    sem_same_type_defs (func_entry) (same_type_defs);
    sem_formal_defs    (func_entry) (func_type) (rest)

and sem_same_type_defs func_entry same_type_defs =
  match same_type_defs.defs_info with
  | SameTypeDefs (par_type, par_name) ->
    sem_defs_byval (func_entry) (par_type) (par_name) (same_type_defs.defs_error_pos)
  | SameTypeDefsByRef (par_type, par_name) ->
    sem_defs_byref (func_entry) (par_type) (par_name) (same_type_defs.defs_error_pos)

and sem_defs_byval func_entry par_type par_name (startpos, endpos) =
  match par_name with
  | [] -> ()
  | (def::rest) ->
    let par_entry = newParameter (id_make def) par_type PASS_BY_VALUE func_entry true
    in ignore par_entry;
    sem_defs_byval (func_entry) (par_type) (rest) (startpos, endpos)

and sem_defs_byref func_entry par_type par_name (startpos, endpos) =
  match par_name with
  | [] -> ()
  | (def :: rest) ->
    let par_entry = newParameter (id_make def) par_type PASS_BY_REFERENCE func_entry true
    in ignore par_entry;
    sem_defs_byref (func_entry) (par_type) (rest) (startpos, endpos)

and sem_inside_fun_list inside_fun_list func_entry =
  match inside_fun_list with
  | [] -> ()
  | inside_fun :: rest ->
    sem_inside_fun inside_fun func_entry;
    sem_inside_fun_list rest func_entry

and sem_inside_fun inside_fun func_entry =
  match inside_fun with
  | I_Fundef (func_def) ->
    sem_fun_def func_def
  | I_Fundecl (func_decl) ->
    sem_fun_decl func_decl
  | I_Vardecl (var_decl) ->
    sem_var_decl var_decl func_entry
  | NO_OTHER_DEF -> ()

and sem_fun_decl func_decl =
  let func_entry = sem_fun_header func_decl
  in
  forwardFunction func_entry;
  printSymbolTable()

(*we will use var_decl position after newVariable with TRY WITH*)

and sem_var_decl var_decl func_entry =
  match var_decl.var_info with
  | (_, []) ->  printSymbolTable ();
  | (var_type, name::rest) ->
    let v1 = newVariable (id_make name) var_type func_entry.entry_info true
    in
    ignore v1;
    sem_var_decl { var_info = (var_type, rest); var_error_pos = var_decl.var_error_pos } func_entry

and sem_stmts stmts fun_name =
  match stmts with
  | [] -> ()
  | stmt :: rest -> (
      sem_stmt stmt fun_name;
      sem_stmts rest fun_name
    )

and sem_stmt stmt fun_name =
  match stmt with
  | S_simple simple ->
    sem_simple simple
  | S_exit ->
    closeScope();
  | S_return expr ->
     let expr_entry = sem_expr expr in
      let func_entry =  lookupEntry (id_make fun_name) LOOKUP_ALL_SCOPES true in
      begin
        match func_entry.entry_info with
        | ENTRY_function func_info ->
        (
          Printf.printf "%s\n" fun_name;
          check_return_type (expr, expr_entry, func_info.function_result)
        )
        | _ -> ()
      end
  | S_if if_stmt ->
    sem_if_stmt if_stmt fun_name
  | S_for for_stmt ->
    sem_for_stmt for_stmt fun_name


and sem_simple simple =
  match simple.simple_info with
  | Simple_skip -> ()
  (*)| Simple_assignment (atom, expr) ->
    let atom_entry = sem_atom (atom)  in
      let expr_entry = sem_expr (expr) in
        check_type_assignment (atom_entry) (expr_entry)
  *)
  | Simple_assignment (atom, expr) ->
    let atom_entry = sem_atom (atom)  in
    let expr_entry = sem_expr (expr) in
    check_type_assignment (atom) (atom_entry) (expr) (expr_entry) (simple.simple_error_pos)


  | Simple_call call ->
    let call_entry = sem_call (call) (simple.simple_error_pos) in
    ignore call_entry(*call = (string * ast_expr list)*)


(*we will use call position after lookupEntry with TRY WITH*)

(*Returns an entry*)
and sem_call call (startpos, endpos) =
  match call with
  | (call_name, call_expr_list) ->
    Printf.printf "i am calling a function\n";
    let call_entry = lookupEntry (id_make call_name) LOOKUP_ALL_SCOPES true in
    (
      (
      let expr_entry_list : Symbol.entry list = List.rev (sem_expr_list (call_expr_list) ([])) in
          check_parameters (call_entry, call_expr_list, expr_entry_list) (startpos, endpos)
      );
      call_entry
    )
(*Returns an entry*)
and sem_atom atom =
  match atom.atom_info with
  | A_var var_atom ->
    let atom_entry = lookupEntry (id_make var_atom) LOOKUP_ALL_SCOPES true in
    (
      (
      match atom_entry.entry_info with
      | ENTRY_variable variable_info ->
          atom.atom_frame_place <- variable_info.variable_frame_place;
          atom.atom_depth <- atom_entry.entry_scope.sco_nesting;
          atom.atom_byrefFlag <- false;
          Printf.printf "var %s with frame place = %d and depth =  %d\n"
                          var_atom atom.atom_frame_place atom.atom_depth
      | ENTRY_parameter parameter_info ->
          atom.atom_frame_place <- parameter_info.parameter_frame_place;
          atom.atom_depth <- atom_entry.entry_scope.sco_nesting;
          atom.atom_byrefFlag <-
            (
              match parameter_info.parameter_mode with
              | PASS_BY_VALUE -> false
              | PASS_BY_REFERENCE -> true

            );
          Printf.printf "par %s with frame place = %d and depth =  %d\n"
                          var_atom atom.atom_frame_place atom.atom_depth

      | _ -> raise TypeError
      );
      atom_entry
    )
  (*| A_structure (stru_atom, stru_expr) -> sem_struct (stru_atom) (stru_expr)*)
  | A_structure (_, _) -> sem_struct atom
  (* ------------------------------------------ *)
  (* DEN MPOREI NA EINAI LVALUES *)
  | A_call call_atom -> sem_call call_atom (atom.atom_error_pos)
  | A_string str_atom -> newTemporary (TYPE_array (TYPE_char, -1))

and sem_struct atom =
  let atom_entry = get_structure_entry atom in
  let atom_dim = get_atom_dimension atom 0 in
  let entry_dim = get_entry_dimension atom_entry in
    if (atom_dim > entry_dim) then
      (structure_dimension_error atom.atom_error_pos;
       atom_entry)
    else atom_entry

(*Returns the entry of the Structure and also checks the type of the expressions*)
and get_structure_entry atom =
  match atom.atom_info with
  | A_var var_atom ->
  let atom_entry = lookupEntry (id_make var_atom) LOOKUP_ALL_SCOPES true in
  (
    (
      match atom_entry.entry_info with
      | ENTRY_variable variable_info ->
          atom.atom_frame_place <- variable_info.variable_frame_place;
          atom.atom_depth <- atom_entry.entry_scope.sco_nesting;
          Printf.printf "var array  %s with frame place = %d and depth =  %d\n"
                          var_atom atom.atom_frame_place atom.atom_depth


      | ENTRY_parameter parameter_info ->
          atom.atom_frame_place <- parameter_info.parameter_frame_place;
          atom.atom_depth <- atom_entry.entry_scope.sco_nesting;
          Printf.printf "par array %s with frame place = %d and depth =  %d\n"
                          var_atom atom.atom_frame_place atom.atom_depth

      | _ -> raise TypeError
      );
    atom_entry
  )
  | A_structure (stru_atom, expr) ->
    let expr_entry_type = get_entry_type (sem_expr expr) in
    let expr_type = get_expr_type (expr.expr_info) (expr_entry_type) in
      if(expr_type <> TYPE_int) then
        (array_index_error expr_type expr.expr_error_pos; raise Terminate)
      else get_structure_entry stru_atom
  | A_call call_atom -> sem_call (call_atom) (atom.atom_error_pos)
  | A_string str_atom -> newTemporary (TYPE_array (TYPE_char, -1))


(* Returns the dimension of an ARRAY as an atom *)
and get_atom_dimension atom cnt =
  (*Printf.printf "%d\n" cnt;*)
  match atom.atom_info with
  | A_var (_) -> cnt
  | A_structure (stru_atom, _) ->  get_atom_dimension (stru_atom) (cnt+1)
  | _ -> (atom_error atom.atom_error_pos; raise Terminate)

and sem_if_stmt if_stmt fun_name =
  match if_stmt with
  | (if_cond, if_body) ->
    (let cond_entry = sem_expr (if_cond)
     in  check_cond_exp (if_cond, cond_entry));
    sem_if_body (if_body) (fun_name)

and sem_if_body if_body fun_name =
  match if_body with
  | (stmts, maybe_elif, maybe_else) ->
    sem_stmts (stmts) (fun_name);
    begin
      match maybe_elif with
      | None -> ()
      | Some (elif_whole) -> sem_elif_whole elif_whole (fun_name)
    end;
    begin
      match maybe_else with
      | None -> ()
      | Some (else_whole) -> sem_stmts (else_whole) (fun_name)
    end

and sem_elif_whole elif_whole (fun_name) =
  match elif_whole with
  | [] -> ()
  | (elif::rest) ->
    sem_elif elif (fun_name);
    sem_elif_whole rest (fun_name)

and sem_elif elif (fun_name) =
  match elif with
  | (elif_cond, elif_body) ->
    (let elif_cond_entry = sem_expr (elif_cond)
     in check_cond_exp (elif_cond, elif_cond_entry));
    sem_stmts (elif_body) (fun_name)

and sem_for_stmt for_stmt fun_name =
  match for_stmt with
  | (for_head, for_body) ->
    sem_for_head (for_head);
    sem_stmts    (for_body) (fun_name)

(* Returns a tuple of (Simple entry list) * Expr entry * (Simple entry list) *)
and sem_for_head for_head =
  match for_head with
  | (simple_list, expr, simple2_list) ->
    sem_simple_list simple_list;
    (let expr_entry = sem_expr expr
     in check_cond_exp (expr, expr_entry) );
    sem_simple_list simple2_list

and sem_simple_list simple_list  =
  match simple_list with
  | [] -> ()
  | simple::rest ->
    sem_simple simple;
    sem_simple_list rest

(*Returns a list of entries*)
and sem_expr_list expr_list acc =
  match expr_list with
  | [] -> acc
  | (expr::rest) ->
    let expr_entry = sem_expr expr
    in sem_expr_list rest (expr_entry::acc)

and sem_expr expr =
  match expr.expr_info with
  | E_const const  -> newTemporary TYPE_int
  | E_character ch -> newTemporary TYPE_char
  | E_atom atom    -> sem_atom atom
  | E_binary_op (expr1, oper, expr2) ->
    check_binary_exp (expr1, sem_expr expr1, expr2, sem_expr expr2);
    newTemporary TYPE_int
  | E_bool_op (expr1, oper, expr2) ->
    check_bool_exp (expr1, sem_expr expr1, expr2, sem_expr expr2);
    newTemporary TYPE_bool
  | E_compare_op (expr1, oper, expr2) ->
    Printf.printf "i'm in compare op\n";
    check_compare_exp (expr1, sem_expr expr1, expr2, sem_expr expr2);
    newTemporary TYPE_bool
  | E_unary_op (oper, expr) ->
    check_unary_exp (oper) (expr, sem_expr expr);
    begin
      match oper with
      | O_not -> newTemporary TYPE_bool
      | O_minus -> newTemporary TYPE_int
      | O_plus -> newTemporary TYPE_int
    end
  | E_true -> newTemporary TYPE_bool
  | E_false -> newTemporary TYPE_bool
  | E_new (new_type, new_expr) ->
    check_new_type (new_type, new_expr, sem_expr new_expr);
    newTemporary (TYPE_array (new_type, -1))
  | E_nil -> newTemporary (TYPE_list (TYPE_none))

  | E_nilqm (nilqm_expr) ->
    let nilqm_entry_type = get_entry_type (sem_expr nilqm_expr) in
    let nilqm_expr_type = get_expr_type nilqm_expr.expr_info nilqm_entry_type in
    begin
      match nilqm_expr_type with
      | TYPE_list (_) -> newTemporary TYPE_bool
      | _ -> (nilqm_type_error nilqm_expr_type nilqm_expr.expr_error_pos; raise Terminate)
    end

  | E_hashtag (hash_expr1, hash_expr2) ->
    let t = check_hashtag (hash_expr1, sem_expr hash_expr1, hash_expr2, sem_expr hash_expr2)
    in newTemporary (t)
  | E_head (head_expr) ->
    let t = check_head_list (head_expr, sem_expr head_expr)
    in newTemporary t
  | E_tail (tail_expr) ->
    let t = check_tail_list (tail_expr, sem_expr tail_expr)
    in newTemporary (t)
