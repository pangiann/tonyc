open Format
open Types
open Lexing
open Symbol


type var = string

type unary_op = O_minus | O_not | O_plus

type binary_op = O_plus | O_minus | O_mul | O_div | O_mod

type compare_op =   O_eq | O_noteq
                | O_less | O_lesseq | O_greater | O_greatereq


type bool_oper = O_or | O_and

type ast_program = ast_func_def

and var_decl_properties = {
  mutable var_info : typ * string list;
  mutable var_error_pos : Lexing.position * Lexing.position;
}

and header_properties = {
  mutable header_info       : ast_header;
  mutable header_error_pos  : Lexing.position * Lexing.position;
  mutable frame_size        : int;
  mutable var_type_list     : entry_info list
}

and same_type_defs_properties = {
  mutable defs_info : ast_same_type_defs;
  mutable defs_error_pos : Lexing.position * Lexing.position;
}

and expr_properties = {
  mutable expr_info : ast_expr;
  mutable expr_error_pos : Lexing.position * Lexing.position;
  mutable expr_type : typ;
  mutable expr_callbyref : bool;
}

and atom_properties = {
  mutable atom_info : ast_atom;
  mutable atom_error_pos : Lexing.position * Lexing.position;
  mutable atom_frame_place : int;
  mutable atom_depth: int;
  mutable atom_byrefFlag : bool;
  mutable atom_callbyref : bool;
}

and simple_properties = {
  mutable simple_info : ast_simple;
  mutable simple_error_pos : Lexing.position * Lexing.position;
}


and if_stmt = if_cond * ( ast_stmt list * (if_cond * ast_stmt list) list option * ast_stmt list option)

and if_cond = expr_properties

and for_stmt = for_head * for_body

and for_body = ast_stmt list

and for_head = simple_properties list * expr_properties * simple_properties list

and call_atom = string * expr_properties list

and ast_func_def =
    Fundef of header_properties * ast_inside_func_def list * ast_stmt list

and ast_header =
    FunHeader of typ * string * same_type_defs_properties list

and ast_same_type_defs = SameTypeDefs       of typ * (string list)
                       | SameTypeDefsByRef  of typ * (string list)

and ast_inside_func_def = NO_OTHER_DEF
                        | I_Fundef of ast_func_def
                        | I_Fundecl of ast_func_decl
                        | I_Vardecl of var_decl_properties

and ast_func_decl = header_properties

and ast_stmt = S_exit
             | S_return of expr_properties
             | S_if of if_stmt
             | S_for of for_stmt
             | S_simple of simple_properties


and ast_simple = Simple_skip
               | Simple_assignment of atom_properties * expr_properties
               | Simple_call       of call_atom


and ast_atom = A_var of var
             | A_string of string
             | A_structure of atom_properties * expr_properties
             | A_call of call_atom


and ast_expr = E_atom of atom_properties
             | E_true
             | E_false
             | E_const of int
             (*| E_var of var*)
             | E_character of char
             | E_binary_op  of expr_properties * binary_op * expr_properties
             | E_compare_op of expr_properties * compare_op * expr_properties
             | E_unary_op of unary_op * expr_properties
             | E_bool_op of expr_properties * bool_oper * expr_properties
             | E_new of typ * expr_properties
             | E_nil
             | E_nilqm of expr_properties
             | E_hashtag of expr_properties * expr_properties
             | E_head of expr_properties
             | E_tail of expr_properties



let ast_tree = ref None
    (*
(* Pretty Prints the AST *)
let rec print_ast_program ppf ast =
  print_ast_fun_def ppf ast;
  print_newline ();

and print_ast_fun_def ppf ast =
  match ast with
  | Fundef (header, inside_fun_list, stmts) ->
    fprintf ppf "{";
    open_hovbox 2;
    fprintf ppf "HEADER( ";
    print_fun_header ppf header;
    fprintf ppf "), ";
    fprintf ppf "DEFINITIONS( ";
    print_inside_fun_list ppf inside_fun_list;
    fprintf ppf "), ";
    fprintf ppf "STATEMENTS( ";
    print_ast_stmts ppf stmts;
    fprintf ppf ")";
    close_box ();
    force_newline ();
    fprintf ppf "}\n"

and print_fun_header ppf header =
  match header with
  | FunHeader (mytype, name, formal_defs) ->
    pretty_typ ppf mytype;
    fprintf ppf "%s (" name;
    print_formal_defs ppf formal_defs;
    fprintf ppf ") " ;

and pretty_typ ppf typ =
  match typ with
  | TYPE_none ->
    ()
  | TYPE_int ->
    fprintf ppf "int "
  | TYPE_char ->
    fprintf ppf "char "
  | TYPE_bool ->
    fprintf ppf "bool "
  | TYPE_array (et, sz) ->
    pretty_typ ppf et;
    if sz >= 0 then
      fprintf ppf " [%d]" sz
    else
      fprintf ppf " []"
  | TYPE_list t ->
    pretty_typ ppf t;
    fprintf ppf "list"


and print_vars ppf vars =
  match vars with
  | [] ->
    ()
  | [var] ->
    fprintf ppf "%s" var
  | var::rest ->
    fprintf ppf "%s, " var;
    print_vars ppf rest

and print_formal_defs ppf formal_defs =
  match formal_defs with
  | [] ->
    ()
  | [same_type_def] ->
    print_same_type_defs ppf same_type_def
  | same_type_def::rest ->
    print_same_type_defs ppf same_type_def;
    fprintf ppf ", ";
    print_formal_defs ppf rest

and print_same_type_defs ppf ast =
  match ast with
  | SameTypeDefs (mytype, name) ->
    pretty_typ ppf mytype;
    print_defs ppf name
  | SameTypeDefsByRef (mytype, name) ->
    pretty_typ ppf mytype;
    print_byref_defs ppf name

and print_defs ppf name =
  match name with
  | [] ->
    ()
  | [defs] ->
    fprintf ppf " %s" defs
  | defs::rest ->
    fprintf ppf " %s," defs;
    print_defs ppf rest

and print_byref_defs ppf name =
  match name with
  | [] ->
    ()
  | [defs] ->
    fprintf ppf "REF %s" defs
  | defs::rest ->
    fprintf ppf "REF %s, " defs;
    print_byref_defs ppf rest

and print_inside_fun_list ppf inside_fun_list =
  match inside_fun_list with
  | [] ->
    ()
  | [inside_fun] ->
    print_inside_fun ppf inside_fun
  | inside_fun :: rest ->
    print_inside_fun ppf inside_fun;
    fprintf ppf ", ";
    print_inside_fun_list ppf rest


and print_inside_fun ppf inside_fun =
  match inside_fun with
  | I_Fundef (func_def) ->
    force_newline();
    print_ast_fun_def ppf func_def;
  | I_Fundecl (func_decl) ->
    print_ast_fun_decl ppf func_decl
  | I_Vardecl (var_decl) ->
    print_ast_var_decl ppf var_decl
  | NO_OTHER_DEF ->
    ()

and print_ast_fun_decl ppf fun_decl =
  fprintf ppf "func_decl: ";
  print_fun_header ppf fun_decl

and print_ast_var_decl ppf var_decl =
  match var_decl with
  | (mytype, name) ->
    pretty_typ ppf mytype;
    print_defs ppf name


and print_ast_stmts ppf stmts =
  match stmts with
  | [] ->
    ()
  | [stmt] ->
    print_ast_stmt ppf stmt;
    force_newline();
  | stmt::rest ->
    print_ast_stmt ppf stmt;
    force_newline ();
    print_ast_stmts ppf rest

and print_ast_stmt ppf stmt =
  match stmt with
  | S_simple simple ->
    print_ast_simple ppf simple
  | S_exit ->
    fprintf ppf "exit..."
  | S_return expr ->
    fprintf ppf "return ";
    print_ast_expr ppf expr;
  | S_if if_stmt ->
    fprintf ppf "if ";
    print_ast_if ppf if_stmt;
  | S_for for_stmt ->
    fprintf ppf "for ";
    print_ast_for ppf for_stmt

and print_ast_simple ppf simple =
  match simple with
  | Simple_skip ->
    ()
  | Simple_assignment (atom, expr) ->
    print_ast_atom ppf atom;
    fprintf ppf " := ";
    print_ast_expr ppf expr
  | Simple_call call ->
    print_ast_call ppf call

and print_ast_call ppf call =
  match call with
  | (var, maybe_params) ->
    fprintf ppf "%s" var;
    fprintf ppf "( ";
    print_ast_actual_params ppf maybe_params;
    fprintf ppf ") ";

and print_ast_actual_params ppf params =
  match params with
  | [] ->
    ()
  | [expr] ->
    print_ast_expr ppf expr
  | expr::rest ->
    print_ast_expr ppf expr;
    fprintf ppf ",";
    print_ast_actual_params ppf rest;

and print_ast_if ppf if_stmt =
  match if_stmt with
  | (if_cond, if_body) ->
    fprintf ppf "(";
    print_ast_expr ppf if_cond;
    fprintf ppf "):";
    open_hovbox 2;
    print_ast_if_body ppf if_body;
    close_box ();

and print_ast_if_body ppf if_body =
  match if_body with
  | (stmts, maybe_elif, maybe_else) ->
    print_ast_stmts ppf stmts;
    (match maybe_elif with
     | None -> ()
     | Some (elif_whole) ->
       force_newline ();
       print_ast_elif_whole ppf elif_whole;
       (*close_box ();*)
    );
    (match maybe_else with
     | None -> ()
     | Some else_whole ->
       force_newline();
       fprintf ppf "else ";
       open_hovbox 2;
       print_ast_stmts ppf else_whole;
       close_box ();
    )


and print_ast_elif_whole ppf elif_whole =
  match elif_whole with
  | [] ->
    ()
  | [elif] ->
    fprintf ppf "elif ";
    print_ast_elif ppf elif
  | elif::rest ->
    fprintf ppf "elif ";
    print_ast_elif ppf elif;
    print_ast_elif_whole ppf rest

and print_ast_elif ppf elif =
  match elif with
  | (elif_cond, elif_body) ->
    fprintf ppf "(";
    print_ast_expr ppf elif_cond;
    fprintf ppf "):";
    open_hovbox 2;
    force_newline ();
    print_ast_stmts ppf elif_body;
    close_box ();

and print_ast_for ppf for_stmt =
  match for_stmt with
  | (for_head, for_body) ->
    print_ast_for_head ppf for_head;
    fprintf ppf ":";
    open_hovbox 2;
    force_newline ();
    print_ast_stmts ppf for_body;
    close_box ();

and print_ast_for_head ppf for_head =
  match for_head with
  | (simple_list, expr, simple2_list) ->
    fprintf ppf "( ";
    print_ast_simple_list ppf simple_list;
    fprintf ppf "; ";
    print_ast_expr ppf expr;
    fprintf ppf "; ";
    print_ast_simple_list ppf simple2_list;
    fprintf ppf ") ";

and print_ast_simple_list ppf simple_list =
  match simple_list with
  | [] ->
    ()
  | [simple] ->
    print_ast_simple ppf simple
  | simple::rest ->
    print_ast_simple ppf simple;
    fprintf ppf ", ";
    print_ast_simple_list ppf rest

and print_ast_expr ppf ast =
  match ast with
  | E_const i ->
    fprintf ppf " %d " i
  | E_character ch ->
    fprintf ppf " %c " ch
  | E_atom  atom ->
    print_ast_atom ppf atom
  | E_binary_op (expr1, oper, expr2) ->
    (match oper with
     | O_plus ->
       print_ast_expr ppf expr1;
       fprintf ppf " + ";
       print_ast_expr ppf expr2
     | O_minus ->
       print_ast_expr ppf expr1;
       fprintf ppf " - ";
       print_ast_expr ppf expr2
     | O_div ->
       print_ast_expr ppf expr1;
       fprintf ppf " / ";
       print_ast_expr ppf expr2
     | O_mul ->
       print_ast_expr ppf expr1;
       fprintf ppf " * ";
       print_ast_expr ppf expr2
     | O_mod ->
       print_ast_expr ppf expr1;
       fprintf ppf " mod ";
       print_ast_expr ppf expr2)
  | E_bool_op (expr1, oper, expr2) ->
    (match oper with
     | O_and ->
       print_ast_expr ppf expr1;
       fprintf ppf " and ";
       print_ast_expr ppf expr2
     | O_or ->
       print_ast_expr ppf expr1;
       fprintf ppf " or ";
       print_ast_expr ppf expr2)
  | E_compare_op (expr1, oper, expr2) ->
    (match oper with
     | O_less ->
       print_ast_expr ppf expr1;
       fprintf ppf " < ";
       print_ast_expr ppf expr2
     | O_greater ->
       print_ast_expr ppf expr1;
       fprintf ppf " > ";
       print_ast_expr ppf expr2
     | O_noteq ->
       print_ast_expr ppf expr1;
       fprintf ppf " <> ";
       print_ast_expr ppf expr2
     | O_lesseq ->
       print_ast_expr ppf expr1;
       fprintf ppf " <= ";
       print_ast_expr ppf expr2
     | O_greatereq ->
       print_ast_expr ppf expr1;
       fprintf ppf " >= ";
       print_ast_expr ppf expr2
     | O_eq ->
       print_ast_expr ppf expr1;
       fprintf ppf " == ";
       print_ast_expr ppf expr2)

  | E_unary_op (oper, expr) ->
    (match oper with
     | O_not ->
       fprintf ppf "not ";
       print_ast_expr ppf expr
     | O_minus ->
       fprintf ppf "- ";
       print_ast_expr ppf expr
     | O_plus ->
       fprintf ppf "+ ";
       print_ast_expr ppf expr)
  | E_true ->
    fprintf ppf "true "
  | E_false ->
    fprintf ppf "false "

and print_ast_atom ppf atom =
  match atom with
  | A_var var ->
    fprintf ppf " %s " var
  | A_string str ->
    fprintf ppf " %s " str
  | A_structure (atom, expr) ->
    print_ast_atom ppf atom;
    fprintf ppf "[";
    print_ast_expr ppf expr;
    fprintf ppf "]";
  | A_call call ->
    print_ast_call ppf call;


and pretty_print ppf ast =
  match ast with
  | None ->
    eprintf "%s@." "AST(ast_analysis) is empty"
  | Some tree ->
    print_ast_program ppf tree

let print_ast ast_tree =
  force_newline ();
  printf "*** Pretty Printing AST ***";
  force_newline ();
  printf "***************************";
  force_newline ();
  printf "%a" pretty_print ast_tree;
  force_newline ()




    (*
let vars = Array.create 26 0

let rec run_expr ast =
  match ast with
  | E_const n         -> n
  (*| E_character x     -> vars.(int_of_char x - int_of_char 'a')*)
  | E_op (e1, op, e2) -> let v1 = run_expr e1
                         and v2 = run_expr e2 in
match op with
| O_plus  -> v1 + v2
| O_minus -> v1 - v2
| O_mul -> v1 * v2
             | O_div -> v1 / v2
             | O_mod -> v1 mod v2
             | O_equal -> int_of_bool (v1 = v2)
             | O_noteq -> int_of_bool (v1 <> v2)
             | O_less  -> int_of_bool (v1 < v2)
             | O_lesseq  -> int_of_bool (v1 <= v2)
             | O_greater -> int_of_bool (v1 > v2)
             | O_greatereq -> int_of_bool (v1 >= v2)

  | E_unary_op (op, e) -> let v = run_expr e in
             match op with
             | O_not -> int_of_bool (not v
             | O_minus -> -v


let rec run_stmt ast =
  match ast with
  | S_print e    -> let v = run_expr e in
                    Printf.printf "%d\n" v
  | S_let (x, e) -> let v = run_expr e in
                    vars.(int_of_char x - int_of_char 'a') <- v
  | S_for (e, s) -> let v = run_expr e in
                    for i = 1 to v do
run_stmt s
done
  | S_block b    -> run b
  | S_if (e, s)  -> let v = run_expr e in
                    if v <> 0 then run_stmt s

and run asts = List.iter run_stmt asts


%inline unary_op:
| T_minus   {  "-"  }
| T_plus    {  "+"  }

%inline binary_op:
| T_plus    {  "+"  }
| T_minus   {  "-"  }
| T_times   {  "*"  }
| T_div     {  "/"  }
| T_mod     { "mod" }

%inline cmp_op:
| T_eq      {  "="  }
| T_neq     { "<>"  }
| T_greater {  ">"  }
| T_less    {  "<"  }
| T_ge      { ">="  }
| T_le      { "<="  }

%inline boolean_op:
      | T_and     { "and" }
| T_or      { "or"  }
*)
*)
