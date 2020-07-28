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



val ast_tree  : ast_program option ref
(*val print_ast : ast_program option -> unit*)
