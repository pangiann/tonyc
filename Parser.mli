
(* The type of tokens. *)

type token = 
  | T_var of (string)
  | T_true
  | T_tail
  | T_string of (string)
  | T_skip
  | T_semicolon
  | T_rparen
  | T_return
  | T_ref
  | T_rbracket
  | T_plus
  | T_or
  | T_noteq
  | T_not
  | T_nil_qm
  | T_nil
  | T_new
  | T_mul
  | T_mod
  | T_minus
  | T_lparen
  | T_list
  | T_lesseq
  | T_less
  | T_lbracket
  | T_int
  | T_if
  | T_head
  | T_hashtag
  | T_greatereq
  | T_greater
  | T_for
  | T_false
  | T_exit
  | T_equal
  | T_eof
  | T_end
  | T_elsif
  | T_else
  | T_div
  | T_def
  | T_decl
  | T_const of (int)
  | T_comma
  | T_colon
  | T_character of (char)
  | T_char
  | T_bool
  | T_assignment
  | T_array
  | T_and

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val program: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Ast.ast_program)
