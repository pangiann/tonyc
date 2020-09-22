open Llvm
open Llvm_analysis
open Llvm_scalar_opts
open Llvm_ipo
open Llvm_vectorize
open Llvm_target
open Llvm.PassManager
open Types
open Ast
open Symbol
open Error
open Format
open Identifier

let context = global_context ()
let the_module = create_module context "GiannSpider42"
let the_fpm = PassManager.create_function the_module

let builder = builder context
let int_type = i64_type context
let int_type32 = i32_type context
let char_type = i8_type context
let void_type = void_type context
let bool_type = i1_type context

let ret_flag = ref 0
let type_stack = Stack.create ()

let lib_func_list = ref []
let rec_func_list = ref []
let decl_func_list = ref []
let prev_decl_func_list = ref []

let rec search_func l name =
        match l with
        | [] -> false
        | x::xs ->
        (
                if (x = name) then (true)
                else search_func (xs) (name)
        )


module H = Hashtbl.Make (
  struct
    type t = id
    let equal = (==)
    let hash = Hashtbl.hash
  end
)

let funtable = ref (H.create 0)
let frame_counter = ref 0
let initFunTable size =
  funtable := H.create size

let rec to_llvm_type x =
  match x with
  | TYPE_int -> int_type
  | TYPE_char -> char_type
  | TYPE_bool -> bool_type
  | TYPE_array (t,n) ->  (pointer_type (to_llvm_type (t)))
  | TYPE_none -> void_type
  | TYPE_list t -> (pointer_type (to_llvm_type (t)))
  | _ -> raise Terminate




and codegen_frame_search fr depth =
        match depth with
        | 0 -> fr
        | _ ->
        (
            let fr_first_pos = build_struct_gep fr 0 "" builder in
            let new_fr = build_load fr_first_pos "" builder in
            codegen_frame_search new_fr (depth - 1)
        )

let rec gen_maybe_program ast_tree opts =
  match ast_tree with
  | None ->
    eprintf "%s@." "AST IS EMPTY"
  | Some tree ->
    gen_ast (tree) (opts)

and library_functions () =
  let ft = function_type (void_type) [| int_type |] in
  ignore(declare_function "puti" ft the_module);
  ignore(lib_func_list := "puti"::(!lib_func_list));


  let ft = function_type (void_type) [| char_type |] in
  ignore(declare_function "putb" ft the_module);
  ignore(lib_func_list := "putb"::(!lib_func_list));

  let ft = function_type (pointer_type char_type) [| int_type |] in
  ignore(declare_function "GC_malloc" ft the_module);
  ignore(lib_func_list := "GC_malloc"::(!lib_func_list));

  let ft = function_type (void_type) [| |] in
  ignore(declare_function "GC_init" ft the_module);
  ignore(lib_func_list := "GC_init"::(!lib_func_list));

  let ft = function_type (void_type) [| char_type |] in
  ignore(declare_function "putc" ft the_module);
  ignore(lib_func_list := "putc"::(!lib_func_list));

  let ft = function_type (void_type) [| pointer_type char_type |] in
  ignore(declare_function "puts" ft the_module);
  ignore(lib_func_list := "puts"::(!lib_func_list));

  let ft = function_type (int_type) [| |] in
  ignore(declare_function "geti" ft the_module);
  ignore(lib_func_list := "geti"::(!lib_func_list));

  let ft = function_type (char_type) [| |] in
  ignore(declare_function "getc" ft the_module);
  ignore(lib_func_list := "getc"::(!lib_func_list));

  let ft = function_type (char_type) [| |] in
  ignore(declare_function "getchar" ft the_module);
  ignore(lib_func_list := "getchar"::(!lib_func_list));

  let ft = function_type (void_type) [| int_type; (pointer_type char_type) |] in
  ignore(declare_function "gets" ft the_module);
  ignore(lib_func_list := "gets"::(!lib_func_list));


  let ft = function_type (int_type) [| char_type |] in
  ignore(declare_function "ord" ft the_module);
  ignore(lib_func_list := "ord"::(!lib_func_list));

  let ft = function_type (char_type) [| int_type |] in
  ignore(declare_function "chr" ft the_module);
  ignore(lib_func_list := "chr"::(!lib_func_list));


  let ft = function_type (int_type) [| int_type |] in
  ignore(declare_function "abs" ft the_module);
  ignore(lib_func_list := "abs"::(!lib_func_list));

  let ft = function_type (int_type) [| pointer_type char_type |] in
  ignore(declare_function "strlen" ft the_module);
  ignore(lib_func_list := "strlen"::(!lib_func_list));

  let ft = function_type (int_type) [| (pointer_type char_type); (pointer_type char_type) |] in
  ignore(declare_function "strcmp" ft the_module);
  ignore(lib_func_list := "strcmp"::(!lib_func_list));

  let ft = function_type (void_type) [| (pointer_type char_type); (pointer_type char_type) |] in
  ignore(declare_function "strcpy" ft the_module);
  ignore(lib_func_list := "strcpy"::(!lib_func_list));

  let ft = function_type (void_type) [| (pointer_type char_type); (pointer_type char_type) |] in
  ignore(declare_function "strcat" ft the_module);
  ignore(lib_func_list := "strcat"::(!lib_func_list));

  ()

and add_opts pm =
    let opts = [
        add_ipsccp; add_memory_to_register_promotion; add_dead_arg_elimination;
        add_instruction_combination; add_cfg_simplification;
        add_function_inlining; add_function_attrs; add_scalar_repl_aggregation;
        add_early_cse; add_cfg_simplification; add_instruction_combination;
        add_tail_call_elimination; add_reassociation; add_loop_rotation;
        add_loop_unswitch; add_instruction_combination; add_cfg_simplification;
        add_ind_var_simplification; add_loop_idiom; add_loop_deletion;
        add_loop_unroll; add_gvn; add_memcpy_opt; add_sccp; add_licm;
        add_global_optimizer; add_global_dce;
        add_aggressive_dce; add_cfg_simplification; add_instruction_combination;
        add_dead_store_elimination; add_loop_vectorize; add_slp_vectorize;
        add_strip_dead_prototypes; add_global_dce; add_constant_propagation;
        add_cfg_simplification
    ] in
    List.iter (fun f -> f pm) opts


and gen_ast ast_tree opts =


  (*declare library functions*)
  library_functions();

  (* Initialize *)
  ignore(Llvm_all_backends.initialize());
  initFunTable 255;


  (frame_counter := !frame_counter + 1);
  let func_t = function_type void_type [| |] in
  let func = declare_function "first" func_t the_module in
  let bb = append_block context "first_entry" func in
  ignore(position_at_end bb builder);
  (* create llvm pointer type from prev_rbp *)
  let foo = [(i64_type context)] in
  (* create the structure for new frame *)
  let frame_type_array = Array.of_list (List.concat [foo]) in
  let frame_type = struct_type context frame_type_array in
  (* allocate the new frame *)
  let builder2 = builder_at context (instr_begin (entry_block func)) in
  let new_frame = build_alloca frame_type (String.concat "." ["fr"]) builder in
  let fr_first_pos = build_struct_gep new_frame 0 "fr_first_pos" builder2 in
      ignore(build_store (const_int int_type 0) (fr_first_pos) (builder2));

  ignore(position_at_end bb builder);

  gen_fun_def ast_tree (new_frame) ([| |]);
  ignore (Llvm.build_ret_void builder2);
  (frame_counter := !frame_counter - 1);
  (* Verify *)


  (* Print out the IR *)
  (*Llvm.print_module "a.ll" the_module*)
  (if opts then
    let mpm = PassManager.create () in
    add_opts mpm;
    ignore(PassManager.run_module the_module mpm));

  (*Llvm_analysis.assert_valid_module the_module;*)


and gen_fun_def ast current_fr param_arr  =
  match ast.func_info with
  | Fundef (header, inside_fun_list, stmts) ->
    let depth_of_func = ast.func_depth in
    let (func_entry_block, the_function, func_name) = gen_fun_header (header) (param_arr)  in

    (* local vars and parameters*)
    let prev_rbp_type_list =
      if func_name = "main" then [pointer_type (int_type)]
      else
        [type_of (Array.get param_arr 0)]

    in
    let var_type_list =  (List.map gen_same_type_def header.var_type_list) in
    let frame_type_array = Array.of_list (List.concat [prev_rbp_type_list; List.rev (var_type_list)]) in
    let frame_type = struct_type context frame_type_array in
      ignore(Stack.push frame_type type_stack);

    (* allocate the new frame *)
    let builder2 = builder_at context (instr_begin (entry_block the_function) ) in
    let new_frame = build_alloca frame_type (String.concat "." [func_name; "fr"]) builder2 in

    let i = ref 0 in
    let par_arr = params the_function in (
			Array.iteri (fun i a ->
				set_value_name "par" a;
			) par_arr;

    let store_param param =
      let elem_ptr = build_struct_gep new_frame !i "frame_elem" builder2 in
      ignore(build_store param elem_ptr builder2); incr i;
    in
      if (Array.length par_arr <> 0) then
        ignore(Array.map store_param par_arr);



    gen_inside_fun_list (inside_fun_list) (new_frame);
    position_at_end func_entry_block builder;
    gen_stmts (new_frame) (stmts) (func_name)  (depth_of_func);



   (*generate return code, if return stmt doesn't exist*)
   (if (!ret_flag = 0) then
      ignore(build_ret_void builder);
      ret_flag := 0
   );
   (* pop from stack the frame type of function *)
   (* because function terminates now *)
   ignore(Stack.pop type_stack);
   (rec_func_list :=
    match !rec_func_list with
    | [] -> []
    | hd :: tl -> tl
   );
   (* and decrement frame_counter by one *)
  (frame_counter := !frame_counter - 1);
  )

  (*Llvm_analysis.assert_valid_function the_function*)

(*return func entry basic block and the function *)
and gen_fun_header header (param_arr)  =
  match header.header_info with
  | FunHeader(func_type, name, formal_defs) ->
    (frame_counter := !frame_counter + 1);
    if ((name <> "main") && (search_func (!prev_decl_func_list) (name)) <> true) then
    (
      let llvm_param_type_arr = (gen_formal_defs formal_defs [| |]) in
      let frame_pointer_type =  [type_of (Array.get param_arr 0)] in
      let final_par_typ_arr = Array.append  (Array.of_list frame_pointer_type) llvm_param_type_arr in
      let func_t = function_type (to_llvm_type func_type) (final_par_typ_arr) in
      let func = declare_function name func_t the_module in
      let bb = append_block context "func_entry" func in
      ignore(position_at_end bb builder);
      (bb, func, name)
    )
    else if ((search_func (!prev_decl_func_list) (name)) <> false) then
    (
      let func = my_lookup_function name in
      let bb = append_block context "func_entry" func in
      ignore(position_at_end bb builder);
      (bb, func, name)
    )
    else
    (
      let llvm_param_type_arr = (gen_formal_defs formal_defs [| |]) in
      let func_t = function_type (to_llvm_type func_type) (llvm_param_type_arr) in
      let func = declare_function name func_t the_module in
      let bb = append_block context "func_entry" func in
        ignore(position_at_end bb builder);
      let ll_func = my_lookup_function "GC_init" in
        ignore(build_call ll_func [| |] "" builder);
        (bb, func, name)
   )


(*returns an array of Types.typ for the function parameters*)
(*e.g. foo(int a,b; char c) ---->  [int, int, char]*)
and gen_formal_defs formal_defs acc_array =
  match formal_defs with
  | [] -> acc_array
  | (same_type_defs::rest) ->
    let temp_type_array = gen_same_type_defs same_type_defs in
    gen_formal_defs rest (Array.append acc_array temp_type_array)

(*returns llvalue TYPES array*)
and gen_same_type_defs same_type_defs =
  match same_type_defs.defs_info with
  | SameTypeDefs (par_type, names_list) -> Array.make (List.length names_list) (to_llvm_type par_type)
  | SameTypeDefsByRef (par_type, names_list) -> Array.make (List.length names_list) (pointer_type (to_llvm_type par_type))


and gen_inside_fun_list inside_fun_list current_fr  =
  match inside_fun_list with
  | [] -> ()
  | inside_fun :: rest ->
    gen_inside_fun inside_fun current_fr;
    gen_inside_fun_list rest current_fr

and gen_inside_fun inside_fun current_fr =
  match inside_fun with
  | I_Fundef (func_def) ->
    begin
      match func_def.func_info with
      | Fundef (header_prop, _, _) ->
        (
          match header_prop.header_info with
          | FunHeader(_, name, _) ->
              H.add !funtable (id_make name) func_def
        )
    end;
    ()
  | I_Fundecl (func_decl) ->
   begin
    match func_decl.header_info with
      | FunHeader(func_type, name, formal_defs) ->
        let llvm_param_type_arr = (gen_formal_defs formal_defs [| |]) in
        let frame_pointer_type = [pointer_type (Stack.top type_stack)] in
        let final_par_typ_arr = Array.append  (Array.of_list frame_pointer_type) llvm_param_type_arr in
        let func_t = function_type (to_llvm_type func_type) (final_par_typ_arr) in
        ignore(declare_function name func_t the_module);
        ignore(prev_decl_func_list := name::(!prev_decl_func_list))
   end
  | I_Vardecl (var_decl) -> ()

  | NO_OTHER_DEF -> ()

and gen_same_type_def entry_info =
  match entry_info with
  | ENTRY_variable var_info ->  to_llvm_type var_info.variable_type
  | ENTRY_parameter par_info ->
    begin
      match par_info.parameter_mode with
      | PASS_BY_VALUE -> to_llvm_type par_info.parameter_type
      | PASS_BY_REFERENCE -> pointer_type (to_llvm_type (par_info.parameter_type))
    end
  | _ -> raise Terminate


and gen_stmts frame stmts (func_name)  (depth_of_func) =
  match stmts with
  | [] -> ()
  | stmt :: rest -> (
      gen_stmt frame stmt (func_name) (depth_of_func);
      gen_stmts frame rest (func_name)  (depth_of_func)
    )

and gen_stmt frame stmt (func_name) (depth_of_func) =
  match stmt.stmt_info with
  | S_simple simple -> ignore(gen_simple (simple) (frame) (func_name) (insertion_block builder) (depth_of_func))
  | S_exit -> ignore(build_ret_void builder)
  | S_return expr ->
     let llexpr = gen_expr frame expr (insertion_block builder) depth_of_func in
     ret_flag := 1;
     ignore(build_ret llexpr builder)
  | S_if if_stmt ->
      ignore(gen_if_stmt frame if_stmt (func_name) (insertion_block builder) (depth_of_func))
  | S_for for_stmt ->
      ignore(gen_for_stmt frame for_stmt (func_name) (insertion_block builder) (depth_of_func))

and gen_if_stmt frame if_stmt (func_name) (current_block) (depth_of_func) =
  match if_stmt with
  | (if_cond, if_body) ->

    (
      let llcond = gen_expr (frame) (if_cond) (current_block) (depth_of_func) in
      let zero = const_int bool_type 0 in
      let cond_val = build_icmp Icmp.Ne llcond zero "ifcond" builder in
      let start_bb = insertion_block builder in
      let the_function = block_parent start_bb in
      gen_if_body frame if_body cond_val the_function start_bb (func_name) current_block (depth_of_func)
    )

and gen_if_body frame if_body if_cond the_function start_bb func_name current_block (depth_of_func) =
  match if_body with
  | (stmts, maybe_elif, maybe_else) ->

      let then_bb = append_block context "then" the_function in
      let after_bb = append_block context "endif" the_function in

      (
        let else_bb =
          begin
            match maybe_elif with
            | None -> let else_bb = append_block context "else" the_function in
                        ignore(build_cond_br if_cond then_bb else_bb builder);
                        else_bb
            | Some (elif_whole) ->
                gen_elif_whole (if_cond) (then_bb) (then_bb) (frame) (the_function) (elif_whole) (after_bb) (func_name) current_block (depth_of_func)
          end
        in
        (
          position_at_end else_bb builder;
          begin
            match maybe_else with
            | None -> ()
            | Some (else_whole) -> gen_stmts (frame) (else_whole) (func_name)  (depth_of_func)
          end;
          (* be careful if we don't have a return stmt then branch to endif, else a return stmt will be created *)
          if !ret_flag = 0 then
          ( ignore(build_br after_bb builder);
            ret_flag := 0
            )
        );
        position_at_end then_bb builder;
        gen_stmts frame stmts func_name (depth_of_func);
        (if !ret_flag = 0 then
         ignore(build_br after_bb builder);
          ret_flag := 0
        );
        position_at_end after_bb builder;
      );



and gen_elif_whole (if_cond) (then_bb) (elif_body_bb) (frame) (the_function) (elif_whole) (after_bb) (func_name) current_block (depth_of_func) =
  match elif_whole with
  | [] ->
    let else_bb = append_block context "else" the_function in
      position_at_end then_bb builder;
      ignore(build_cond_br if_cond elif_body_bb else_bb builder);
      else_bb

  | (elif::rest) ->

    let start_bb = insertion_block builder in
    let the_elif_function = block_parent start_bb in
    let elif_bb = append_block context "elif" the_elif_function in
      ignore(build_cond_br if_cond elif_body_bb elif_bb builder);
      let elif_body_bb = append_block context "elif_body" the_function in
      (
        let elif_cond = gen_elif elif (elif_bb) (elif_body_bb) (after_bb) (frame) (func_name) (the_function) current_block (depth_of_func) in
        gen_elif_whole (elif_cond) (elif_bb) (elif_body_bb)  (frame) (the_elif_function) (rest) (after_bb) (func_name) current_block (depth_of_func)
      )

and gen_elif elif (elif_bb) (elif_body_bb) (after_bb) (frame) (func_name) (the_function) current_block (depth_of_func) =
  match elif with
  | (elif_cond, elif_body) ->

    position_at_end elif_body_bb builder;
    gen_stmts frame elif_body (func_name)  (depth_of_func);
    (if !ret_flag = 0 then
      ignore(build_br after_bb builder);
      ret_flag := 0
    );
    position_at_end elif_bb builder;
    let llcond = gen_expr (frame) (elif_cond) elif_bb (depth_of_func) in
    let zero = const_int bool_type 0 in
    let cond_val = build_icmp Icmp.Ne llcond zero "elif_cond" builder in
        cond_val

and gen_for_stmt frame for_stmt (func_name) current_block (depth_of_func) =
  match for_stmt with
  | (for_head, for_body) ->
    gen_for (frame) (for_head) (for_body) (func_name) current_block (depth_of_func);

and gen_for frame for_head for_body (func_name) current_block (depth_of_func) =
  match for_head with
  | (simple_list, expr, simple2_list) ->

      gen_simple_list (simple_list) (frame) (func_name) (depth_of_func);

      let prev_bb = insertion_block builder in
      let the_function = block_parent prev_bb in

      let loop_bb = append_block context "loop" the_function in
      let body_bb = append_block context "body" the_function in
      let after_bb = append_block context "endfor" the_function in

        ignore(build_br loop_bb builder);
        position_at_end loop_bb builder;
        let for_expr = gen_expr frame expr (loop_bb) (depth_of_func) in
        let loop_cond = build_icmp Icmp.Ne for_expr (const_int bool_type 0) "loop_cond" builder in
        ignore(build_cond_br loop_cond body_bb after_bb builder);

        position_at_end body_bb builder;
        gen_stmts (frame) (for_body) (func_name)  (depth_of_func);
        gen_simple_list (simple2_list) (frame) (func_name) (depth_of_func);

        ignore(build_br loop_bb builder);

        position_at_end after_bb builder;

and gen_simple_list simple_list frame func_name  (depth_of_func) =
  match simple_list with
  | [] -> ()
  | [simple] -> gen_simple simple frame func_name (insertion_block builder) (depth_of_func)
  | simple::rest ->
    (
      gen_simple simple frame func_name (insertion_block builder) (depth_of_func);
      gen_simple_list rest frame func_name  (depth_of_func)
    )

and gen_simple simple frame func_name (current_block) (depth_of_func) =
  match simple.simple_info with
  | Simple_skip -> ()
  | Simple_assignment (atom, expr) ->
    let expr_val = gen_expr frame expr current_block (depth_of_func) in
    begin
      match atom.atom_info with
      | A_var var_atom ->
      (
        let parent_frame = codegen_frame_search frame  (depth_of_func - atom.atom_depth) in
        let var_atom_elemptr = build_struct_gep parent_frame atom.atom_frame_place "var" builder in
          if (atom.atom_byrefFlag <> true) then
              ignore(build_store expr_val var_atom_elemptr builder)
          else
            (
              let var_atom_byref_loaded = build_load var_atom_elemptr "loadbyerf" builder in
                ignore(build_store expr_val var_atom_byref_loaded builder)
            )
      )
      (*  be careful, now we want the address of the element of array where we want to store a value *)
      (* you could check that we call gen_struct with stru_atom and not with the overall atom  *)
      (* e.g. we want x[3] := 1 then we just load x , x[3][3] := 1 we only load x[3] *)
      | A_structure (stru_atom, stru_expr) ->
        let var_atom = gen_struct frame stru_atom current_block (depth_of_func) in
        let index = gen_expr frame stru_expr current_block (depth_of_func) in
        let addr = build_in_bounds_gep var_atom [| index |] "arrtmp" builder in
          ignore(build_store expr_val addr builder)
    end
  | Simple_call call_atom ->
       begin
        match call_atom.call_info with
        | (name, expr_list) ->
         (* check if we call a lib function *)
         let param_list = gen_expr_list expr_list [] frame current_block (depth_of_func) in
         if (search_func (!lib_func_list) (name)) <> true then
         (
           (* if not check if we have a recursion *)
           if (search_func (!rec_func_list) (name)) <> true then
           (
            (* if not check if we've already declared this function *)
             if (search_func (!decl_func_list) (name)) <> true then
                  gen_simple_call param_list frame current_block name depth_of_func call_atom.call_depth
              else
                 gen_simple_decl_call param_list frame current_block name depth_of_func call_atom.call_depth
           )
           else
              gen_simple_rec_call param_list frame current_block name depth_of_func call_atom.call_depth
         )
         else
           gen_simple_lib_call param_list frame current_block name
       end


and gen_simple_call param_list frame current_block name depth_of_func call_depth =
  let param_frame = codegen_frame_search  frame (depth_of_func - call_depth)  in
  let param_arr = Array.of_list (param_frame :: (List.rev param_list)) in (*array of llvalues*)
  ignore(rec_func_list := name::(!rec_func_list));
  ignore(decl_func_list := name::(!decl_func_list));
  let func_def = H.find !funtable (id_make name) in
    ignore(gen_fun_def func_def frame param_arr);
  ignore(position_at_end current_block builder);
  let ll_func = my_lookup_function name in
    ignore(build_call ll_func param_arr "" builder)




and gen_simple_decl_call param_list frame current_block name depth_of_func call_depth =
  let param_frame = codegen_frame_search  frame (depth_of_func - call_depth) in
  let param_arr = Array.of_list (param_frame :: (List.rev param_list)) in (*array of llvalues*)
  let ll_func = my_lookup_function name in
    ignore(build_call ll_func param_arr "" builder);



and gen_simple_lib_call param_list frame current_block name =
  let param_arr = Array.of_list (List.rev param_list) in (*array of llvalues*)
   ignore(position_at_end current_block builder);
  let ll_func = my_lookup_function name in
   ignore(build_call ll_func param_arr "" builder)


and gen_simple_rec_call param_list frame current_block name depth_of_func call_depth =
  let param_frame = codegen_frame_search  frame (depth_of_func - call_depth)  in
  let param_arr = Array.of_list (param_frame :: (List.rev param_list)) in
  ignore(position_at_end current_block builder);
  let ll_func = my_lookup_function name in
    ignore(build_call ll_func param_arr "" builder)





(* this is a significant function *)
(* here we evaluate all expressions that will pass as parameters in a function *)

and gen_expr_list expr_list acc frame current_block (depth_of_func) =
  match expr_list with
  | [] -> acc
  | (x::xs) ->
  begin
     match x.expr_info with
     | E_atom atom ->
      begin
      (* check if this expressions is passed by ref, so we just want the address and not the actual value*)
        if atom.atom_callbyref then
        (* also if we want to pass by ref an element of an array e.g. x[3] , we want a pointer to x[3] *)
        ( match atom.atom_info with
          | A_structure (stru_atom, stru_expr) ->
            let var_atom_elemptr = gen_pass_array atom frame current_block (depth_of_func) in
              gen_expr_list (xs) (var_atom_elemptr :: acc) frame current_block (depth_of_func)
          | _ ->
            let parent_frame = codegen_frame_search frame (depth_of_func - atom.atom_depth) in
            let var_atom_elemptr = build_struct_gep parent_frame atom.atom_frame_place "" builder in
              gen_expr_list (xs) (var_atom_elemptr :: acc) frame current_block (depth_of_func)
        )
        else
          gen_expr_list (xs) ( (gen_expr frame x current_block (depth_of_func)) :: acc ) frame current_block (depth_of_func)
      end
     | E_head h_expr ->
       if x.expr_callbyref then
         let lista = gen_passbyref_list h_expr frame current_block (depth_of_func) in
         let list_ptr = build_in_bounds_gep lista [| const_int int_type 0 |] "listhead" builder in
           gen_expr_list (xs) (list_ptr :: acc) frame current_block (depth_of_func)
       else gen_expr_list (xs) ( (gen_expr frame x current_block (depth_of_func)) :: acc ) frame current_block (depth_of_func)

     | E_tail t_expr ->
       if x.expr_callbyref then
         let lista = gen_passbyref_list t_expr frame current_block (depth_of_func) in
         let list_ptr = build_in_bounds_gep lista [| const_int int_type 1 |] "listtail" builder in
           gen_expr_list (xs) (list_ptr :: acc) frame current_block (depth_of_func)
       else gen_expr_list (xs) ( (gen_expr frame x current_block (depth_of_func)) :: acc ) frame current_block (depth_of_func)

     | _ -> gen_expr_list (xs) ( (gen_expr frame x current_block (depth_of_func)) :: acc ) frame current_block (depth_of_func)
    end



and gen_passbyref_list expr frame current_block (depth_of_func) =
  match expr.expr_info with
  | E_atom atom ->
    let parent_frame = codegen_frame_search frame (depth_of_func - atom.atom_depth) in
    let var_atom_elemptr = build_struct_gep parent_frame atom.atom_frame_place "" builder in
      build_load var_atom_elemptr "" builder
  | E_head h_expr ->
    let expr = gen_passbyref_list h_expr frame  current_block (depth_of_func) in
    let addr = build_in_bounds_gep expr [| const_int int_type 0 |] "listhead" builder in
      build_load addr "loadhead" builder

  | E_tail (tail_expr) ->
    let expr = gen_passbyref_list tail_expr frame  current_block (depth_of_func) in
    let addr = build_in_bounds_gep expr [| const_int int_type 1 |] "lista" builder in
    let lista = build_bitcast (addr) (pointer_type (type_of addr)) "listaptr" builder in
    let listaptr = build_load lista "loadtail" builder in
      listaptr


  | _ -> raise Terminate



(* here we load a pointer to an element of an array *)
(* e.g. we want x[3], we find address of x and then of x[3] *)
(* this function is recursive, so it works for every dimension *)
and gen_pass_array atom frame current_block (depth_of_func) =
  match atom.atom_info with
  | A_var var_atom ->
    let parent_frame = codegen_frame_search frame (depth_of_func - atom.atom_depth) in
    let var_atom_elemptr = build_struct_gep parent_frame atom.atom_frame_place "" builder in
    build_load var_atom_elemptr "" builder

  | A_structure (stru_atom, stru_expr) ->
    let var_atom = gen_pass_array stru_atom frame current_block (depth_of_func) in
    let index = gen_expr frame stru_expr current_block (depth_of_func) in
    let addr = build_in_bounds_gep var_atom [| index |] "arrtmp" builder in
      addr



and gen_atom frame atom current_block (depth_of_func) =
  match atom.atom_info with
  | A_var var_atom ->
    if (atom.atom_byrefFlag <> true) then
    (
      let parent_frame = codegen_frame_search frame (depth_of_func - atom.atom_depth) in
      let var_atom_elemptr = build_struct_gep parent_frame atom.atom_frame_place "" builder in
      let var_atom_loaded = build_load var_atom_elemptr "loadtmp" builder in
          var_atom_loaded
    )
    else
    (
      let parent_frame = codegen_frame_search frame (depth_of_func - atom.atom_depth) in
      let var_atom_elemptr = build_struct_gep parent_frame atom.atom_frame_place "" builder in
      let var_atom_byref_loaded = build_load var_atom_elemptr "loadbyerf" builder in
      let var_atom_loaded = build_load var_atom_byref_loaded "loadtmp" builder in
        var_atom_loaded
    )
  | A_call call_atom ->
    begin
      match call_atom.call_info with
      | (name, expr_list) ->
    (* check if we call a lib function *)
        let param_list = gen_expr_list expr_list [] frame current_block (depth_of_func) in
        if (search_func (!lib_func_list) (name)) <> true then
        (
          (* if not check if we have a recursion *)
          if (search_func (!rec_func_list) (name)) <> true then
          (
           (* if not check if we've already declared this function *)
            if (search_func (!decl_func_list) (name)) <> true then
               gen_atom_call param_list frame current_block name depth_of_func call_atom.call_depth
            else
               gen_atom_decl_call param_list frame current_block name depth_of_func call_atom.call_depth
          )
          else
             gen_atom_rec_call param_list frame current_block name depth_of_func call_atom.call_depth
         )
         else
           gen_atom_lib_call param_list frame current_block name
    end


(*---------------------------SOSSSS--------------------------------*)
   | A_structure (stru_atom, expr) -> gen_struct frame atom current_block (depth_of_func)


   | A_string str_atom -> let p = build_global_string str_atom "strtmp" builder in
			                    build_in_bounds_gep p [| const_int int_type 0; const_int int_type 0 |] "arr_strtmp" builder
(*---------------------------SOSSSS--------------------------------*)



and gen_atom_call param_list frame current_block name depth_of_func call_depth =
  let param_frame = codegen_frame_search  frame (depth_of_func - call_depth) in
  let param_arr = Array.of_list (param_frame :: (List.rev param_list)) in (*array of llvalues*)
    ignore(rec_func_list := name::(!rec_func_list));
    ignore(decl_func_list := name::(!decl_func_list));
  let func_def = H.find !funtable (id_make name) in
    ignore(gen_fun_def func_def frame param_arr);
    ignore(position_at_end current_block builder);
  let ll_func = my_lookup_function name in
    build_call ll_func param_arr "" builder

and gen_atom_decl_call param_list frame current_block name depth_of_func call_depth =
  let param_frame = codegen_frame_search frame (depth_of_func - call_depth) in
  let param_arr = Array.of_list (param_frame :: (List.rev param_list)) in (*array of llvalues*)
  let ll_func = my_lookup_function name in
    build_call ll_func param_arr "" builder


and gen_atom_lib_call param_list frame current_block name =
  let param_arr = Array.of_list (List.rev param_list) in (*array of llvalues*)
    ignore(position_at_end current_block builder);
  let ll_func = my_lookup_function name in
    build_call ll_func param_arr "" builder


and gen_atom_rec_call param_list frame current_block name depth_of_func call_depth =
  let param_frame = codegen_frame_search  frame (depth_of_func - call_depth) in
  let param_arr = Array.of_list (param_frame :: (List.rev param_list)) in
    ignore(position_at_end current_block builder);
  let ll_func = my_lookup_function name in
    build_call ll_func param_arr "" builder




(* here we first load the address of array where exists in stack frame *)
(* and then we load the value of the requested element from heap *)
(* e.g. we need x[3] , we load x ptr from stack and then we load 3rd element of array *)
(* this function is recursive so it works for every dimension *)

and gen_struct frame atom current_block (depth_of_func) =
  match atom.atom_info with
  | A_var var_atom ->
    let parent_frame = codegen_frame_search frame (depth_of_func - atom.atom_depth) in
    let var_atom_elemptr = build_struct_gep parent_frame atom.atom_frame_place "" builder in
      (if (atom.atom_byrefFlag <> true) then
        build_load var_atom_elemptr "" builder
      else
      (
          let var_atom_byref_loaded = build_load var_atom_elemptr "loadbyerf" builder in
          let var_atom_loaded = build_load var_atom_byref_loaded "loadtmp" builder in
            var_atom_loaded
      )
     )
  | A_structure (stru_atom, stru_expr) ->
    let var_atom = gen_struct frame stru_atom current_block (depth_of_func) in
    let index = gen_expr frame stru_expr current_block (depth_of_func) in
    let addr = build_in_bounds_gep var_atom [| index |] "arrtmp" builder in
    build_load addr "load_arr_elem_tmp" builder






and gen_expr frame expr current_block (depth_of_func) =
  match expr.expr_info with
  | E_const const -> const_int int_type const
  | E_character ch -> const_int char_type (int_of_char ch)
  | E_atom atom -> gen_atom frame atom current_block (depth_of_func)
  | E_binary_op (expr1, oper, expr2) ->
    let left_expr = gen_expr frame expr1 current_block (depth_of_func) in
    let right_expr = gen_expr frame expr2 current_block (depth_of_func) in
    begin
      match oper with
        | O_plus  -> build_add left_expr right_expr "addtmp" builder
        | O_minus -> build_sub left_expr right_expr "subtmp" builder
        | O_div   -> build_sdiv left_expr right_expr "divtmp" builder
        | O_mul   -> build_mul left_expr right_expr "multmp" builder
        | O_mod   -> build_srem left_expr right_expr "modtmp" builder
    end

  | E_bool_op (expr1, oper, expr2) ->
    let left_expr = gen_expr frame expr1 current_block (depth_of_func) in
    let right_expr = gen_expr frame expr2 current_block (depth_of_func) in
    begin
      match oper with
       | O_and -> build_and left_expr right_expr "andtmp" builder
       | O_or  -> build_or left_expr right_expr "ortmp" builder
    end

  | E_compare_op (expr1, oper, expr2) ->
     let left_expr = gen_expr frame expr1 current_block (depth_of_func) in
     let right_expr = gen_expr frame expr2 current_block (depth_of_func) in
     begin
       match oper with
       | O_less      -> build_icmp Icmp.Slt left_expr right_expr "lesstmp" builder
       | O_greater   -> build_icmp Icmp.Sgt left_expr right_expr "greatertmp" builder
       | O_noteq     -> build_icmp Icmp.Ne  left_expr right_expr "noteqtmp" builder
       | O_lesseq    -> build_icmp Icmp.Sle left_expr right_expr "lesseqtmp" builder
       | O_greatereq -> build_icmp Icmp.Sge left_expr right_expr "greatereqtmp" builder
       | O_eq        -> build_icmp Icmp.Eq  left_expr right_expr "equaltmp" builder
     end

  | E_unary_op (oper, expr) ->
      let un_expr = gen_expr frame expr current_block (depth_of_func) in
      begin
        match oper with
        | O_not   -> build_not un_expr "nottmp" builder
        | O_minus -> build_neg un_expr "negtmp" builder
        | O_plus  -> un_expr
      end

  | E_true  -> const_int bool_type 1
  | E_false -> const_int bool_type 0
  | E_new (new_type, new_expr) ->
    let expr = gen_expr frame new_expr current_block (depth_of_func) in

    let size_num = build_mul expr (const_int int_type (sizeOfType (new_type))) "sizeofarr" builder in
    let ll_func = my_lookup_function "GC_malloc" in
    (* call malloc *)
    let malloc_ptr = build_call ll_func [| size_num |] "newtmp" builder in
    (* create pointer to first element of array and return it *)
    let struct_type_array = Array.make (1) (to_llvm_type (new_type)) in
    let arr_type = struct_type context struct_type_array in
    let theArrayTypePtr =  qualified_pointer_type arr_type 0 in
    let array_ptr = build_bitcast malloc_ptr theArrayTypePtr "arraytmp" builder in
    let final_ptr = build_bitcast (array_ptr) (pointer_type (to_llvm_type (new_type))) "arrayptr" (builder) in
      final_ptr
  | E_hashtag (hash_expr1, hash_expr2) ->
    let expr1 = gen_expr frame hash_expr1 current_block (depth_of_func) in
    let expr2 = gen_expr frame hash_expr2 current_block (depth_of_func) in

    let ll_func = my_lookup_function "GC_malloc" in
    let malloc_ptr = build_call ll_func [| (const_int (int_type) 16) |] "newtmp" builder in
    let list_type = struct_type context [|(type_of expr1); (type_of expr2)|] in
    let theListTypePtr = qualified_pointer_type list_type 0 in
    let list_ptr = build_bitcast malloc_ptr theListTypePtr "listtmp" builder in
    let final_ptr = build_bitcast (list_ptr) (type_of expr2) "listptr" (builder) in
    let head_ptr = build_gep list_ptr [| const_int int_type32 0; const_int int_type32 0 |] "headptr" builder in
      ignore(build_store (expr1) (head_ptr) (builder));
    let tail_ptr = build_gep (list_ptr) [| const_int int_type32 0; const_int int_type32 1 |] "tailptr" builder in
      ignore(build_store expr2 (tail_ptr) builder);
      final_ptr
  | E_nil -> const_null  (to_llvm_type expr.expr_type)
  | E_nilqm (nilqm_expr) ->
    let expr = gen_expr frame nilqm_expr current_block (depth_of_func) in
      build_icmp Icmp.Eq  expr (const_pointer_null (type_of (expr))) "equaltmp" builder
  | E_head (head_expr) ->
    let expr = gen_expr frame head_expr current_block (depth_of_func) in
    let addr = build_in_bounds_gep expr [| const_int int_type 0 |] "listhead" builder in
      build_load addr "loadhead" builder
  | E_tail (tail_expr) ->
    let expr = gen_expr frame tail_expr current_block (depth_of_func) in
    let addr = build_in_bounds_gep expr [| const_int int_type 1 |] "lista" builder in
    let lista = build_bitcast (addr) (pointer_type (type_of addr)) "listaptr" builder in
    let listaptr = build_load lista "loadtail" builder in
      listaptr


  and my_lookup_function name =
    match lookup_function name the_module with
  	| Some callee -> callee
  	| None -> raise(Failure "Shouldn't happen. Already checked")
