# 1 "Lexer.mll"
 
open Lexing
open Parser




(*  convert string to a list of chars *)
let implode l =
  let result = Bytes.create(List.length l)
  in
    let rec imp i = function
     | [] -> result
     | c::l -> Bytes.set result i c;  imp (i+1) l
    in
     imp 0 l

(* convert list of chars to a string *)
let explode s =
  let rec exp i l =
    if i < 0 then l else exp (i - 1) (s.[i] :: l) in
   exp (String.length s - 1) []


(*  increment lines *)
let incr_linenum lexbuf =
  let pos = lexbuf.Lexing.lex_curr_p in

  lexbuf.Lexing.lex_curr_p <- { pos with
    Lexing.pos_lnum = pos.Lexing.pos_lnum + 1;
    Lexing.pos_bol = pos.Lexing.pos_cnum;
  }
  (*Printf.printf "our lines now are updated to: %d\n" pos.pos_lnum*)


(* function for errors *)
let error s start lexbuf =
    Printf.printf "[--------------------------]\nline: %d char: %d -> %s\n[--------------------------]\n" (start.pos_lnum) (start.pos_cnum - start.pos_bol)  (s)
(*  else
    let pos = lexbuf.Lexing.lex_curr_p in
      Printf.printf "[--------------------------]\nline: %d char: %d -> %s\n[--------------------------]\n" (pos.pos_lnum) (pos.pos_cnum - pos.pos_bol)  (s)*)



let create_hashtable size init =
  let tbl = Hashtbl.create size in
    List.iter (fun (key, data) -> Hashtbl.add tbl key data) init;
     (tbl)
  (*
  type token =
    | T_eof   | T_const | T_var
    | T_int   | T_bool  | T_char
    | T_list  | T_nil   | T_nil_qm | T_hashtag | T_head | T_tail
    | T_array
    | T_new
    | T_skip
    | T_decl  | T_def   | T_return | T_exit | T_ref
    | T_plus  | T_minus | T_mul | T_div | T_mod
    | T_not   | T_and   | T_or | T_true | T_false
    | T_lparen | T_rparen | T_lbracket | T_rbracket
    | T_comma | T_semicolon | T_colon | T_assignment
    | T_equal | T_less | T_lesseq | T_greater | T_greatereq  | T_noteq
    | T_if | T_else | T_elsif | T_for | T_end
    | T_character of char | T_string of string
  *)
  let keyword_table =
  create_hashtable 26 [
     ("int", T_int);     ("bool", T_bool);   ("char", T_char);
     ("list", T_list);   ("nil", T_nil);     ("nil?", T_nil_qm);
     ("head", T_head);   ("tail", T_tail);
     ("new", T_new);
     ("skip", T_skip);
     ("decl", T_decl);   ("def", T_def);     ("return", T_return);     ("exit", T_exit);     ("ref", T_ref);
     ("mod", T_mod);
     ("not", T_not);     ("and", T_and);     ("or", T_or);
     ("true", T_true);   ("false", T_false);
     ("if", T_if);       ("else", T_else);   ("elsif", T_elsif);
     ("for", T_for);     ("end", T_end);
  ]


# 84 "Lexer.ml"
let __ocaml_lex_tables = {
  Lexing.lex_base =
   "\000\000\227\255\228\255\006\000\230\255\075\000\001\000\002\000\
    \091\000\239\255\003\000\242\255\243\255\244\255\245\255\246\255\
    \247\255\248\255\249\255\250\255\251\255\252\255\253\255\254\255\
    \091\000\240\255\232\255\234\255\237\255\235\255\233\255\002\000\
    \172\000\251\255\252\255\253\255\004\000\030\000\255\255\254\255\
    \003\000\055\000\181\000\057\000\095\000\096\000\097\000\098\000\
    \099\000\110\000\255\255\254\255\253\255\252\255\251\255\250\255\
    \249\255\248\255\145\000\252\255\253\255\254\255\255\255\206\000\
    \247\255\248\255\207\000\190\000\250\255\251\255\252\255\253\255\
    \254\255\255\255\208\000\252\255\253\255\254\255\255\255";
  Lexing.lex_backtrk =
   "\255\255\255\255\255\255\026\000\255\255\024\000\027\000\019\000\
    \017\000\255\255\014\000\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \000\000\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\003\000\003\000\255\255\255\255\
    \255\255\008\000\008\000\255\255\007\000\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\006\000\008\000\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255";
  Lexing.lex_default =
   "\002\000\000\000\000\000\255\255\000\000\255\255\031\000\255\255\
    \255\255\000\000\255\255\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \255\255\000\000\000\000\000\000\000\000\000\000\000\000\031\000\
    \034\000\000\000\000\000\000\000\255\255\255\255\000\000\000\000\
    \041\000\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\059\000\000\000\000\000\000\000\000\000\066\000\
    \000\000\000\000\066\000\255\255\000\000\000\000\000\000\000\000\
    \000\000\000\000\075\000\000\000\000\000\000\000\000\000";
  Lexing.lex_trans =
   "\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\003\000\004\000\030\000\030\000\003\000\000\000\003\000\
    \000\000\000\000\000\000\003\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \003\000\000\000\018\000\023\000\000\000\006\000\003\000\017\000\
    \016\000\015\000\020\000\022\000\012\000\021\000\039\000\019\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\010\000\011\000\008\000\009\000\007\000\029\000\
    \025\000\024\000\024\000\024\000\024\000\024\000\024\000\024\000\
    \024\000\024\000\024\000\024\000\024\000\024\000\024\000\024\000\
    \024\000\024\000\024\000\024\000\024\000\024\000\024\000\024\000\
    \024\000\024\000\024\000\014\000\038\000\013\000\057\000\042\000\
    \056\000\024\000\024\000\024\000\024\000\024\000\024\000\024\000\
    \024\000\024\000\024\000\024\000\024\000\024\000\024\000\024\000\
    \024\000\024\000\024\000\024\000\024\000\024\000\024\000\024\000\
    \024\000\024\000\024\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\026\000\055\000\054\000\
    \053\000\052\000\051\000\024\000\024\000\024\000\024\000\024\000\
    \024\000\024\000\024\000\024\000\024\000\050\000\000\000\000\000\
    \028\000\027\000\024\000\062\000\024\000\024\000\024\000\024\000\
    \024\000\024\000\024\000\024\000\024\000\024\000\024\000\024\000\
    \024\000\024\000\024\000\024\000\024\000\024\000\024\000\024\000\
    \024\000\024\000\024\000\024\000\024\000\024\000\035\000\000\000\
    \061\000\000\000\024\000\000\000\024\000\024\000\024\000\024\000\
    \024\000\024\000\024\000\024\000\024\000\024\000\024\000\024\000\
    \024\000\024\000\024\000\024\000\024\000\024\000\024\000\024\000\
    \024\000\024\000\024\000\024\000\024\000\024\000\037\000\043\000\
    \064\000\255\255\078\000\000\000\044\000\000\000\000\000\000\000\
    \068\000\000\000\000\000\000\000\000\000\046\000\000\000\000\000\
    \036\000\000\000\000\000\000\000\000\000\000\000\072\000\000\000\
    \065\000\255\255\077\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \001\000\255\255\255\255\255\255\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\045\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\069\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\049\000\000\000\000\000\000\000\047\000\
    \000\000\048\000\067\000\255\255\073\000\000\000\000\000\000\000\
    \071\000\000\000\070\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\060\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\033\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\255\255\255\255\
    \076\000";
  Lexing.lex_check =
   "\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\000\000\000\000\006\000\031\000\000\000\255\255\003\000\
    \255\255\255\255\255\255\003\000\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \000\000\255\255\000\000\000\000\255\255\000\000\003\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\036\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\007\000\
    \010\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\037\000\000\000\041\000\040\000\
    \043\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\008\000\044\000\045\000\
    \046\000\047\000\048\000\024\000\024\000\024\000\024\000\024\000\
    \024\000\024\000\024\000\024\000\024\000\049\000\255\255\255\255\
    \008\000\008\000\024\000\058\000\024\000\024\000\024\000\024\000\
    \024\000\024\000\024\000\024\000\024\000\024\000\024\000\024\000\
    \024\000\024\000\024\000\024\000\024\000\024\000\024\000\024\000\
    \024\000\024\000\024\000\024\000\024\000\024\000\032\000\255\255\
    \058\000\255\255\024\000\255\255\024\000\024\000\024\000\024\000\
    \024\000\024\000\024\000\024\000\024\000\024\000\024\000\024\000\
    \024\000\024\000\024\000\024\000\024\000\024\000\024\000\024\000\
    \024\000\024\000\024\000\024\000\024\000\024\000\032\000\042\000\
    \063\000\066\000\074\000\255\255\042\000\255\255\255\255\255\255\
    \067\000\255\255\255\255\255\255\255\255\042\000\255\255\255\255\
    \032\000\255\255\255\255\255\255\255\255\255\255\067\000\255\255\
    \063\000\066\000\074\000\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \000\000\006\000\031\000\040\000\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\042\000\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\067\000\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\042\000\255\255\255\255\255\255\042\000\
    \255\255\042\000\063\000\066\000\067\000\255\255\255\255\255\255\
    \067\000\255\255\067\000\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\058\000\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\032\000\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\063\000\066\000\
    \074\000";
  Lexing.lex_base_code =
   "";
  Lexing.lex_backtrk_code =
   "";
  Lexing.lex_default_code =
   "";
  Lexing.lex_trans_code =
   "";
  Lexing.lex_check_code =
   "";
  Lexing.lex_code =
   "";
}

let rec lexer lexbuf =
   __ocaml_lex_lexer_rec lexbuf 0
and __ocaml_lex_lexer_rec lexbuf __ocaml_lex_state =
  match Lexing.engine __ocaml_lex_tables __ocaml_lex_state lexbuf with
      | 0 ->
let
# 95 "Lexer.mll"
          word
# 261 "Lexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos lexbuf.Lexing.lex_curr_pos in
# 96 "Lexer.mll"
   ( try
      let token = Hashtbl.find keyword_table word in
      token
    with Not_found ->
      T_var (word)
    )
# 270 "Lexer.ml"

  | 1 ->
# 103 "Lexer.mll"
             ( T_hashtag )
# 275 "Lexer.ml"

  | 2 ->
# 104 "Lexer.mll"
             ( T_plus )
# 280 "Lexer.ml"

  | 3 ->
# 105 "Lexer.mll"
             ( T_minus )
# 285 "Lexer.ml"

  | 4 ->
# 106 "Lexer.mll"
             ( T_mul )
# 290 "Lexer.ml"

  | 5 ->
# 107 "Lexer.mll"
             ( T_div )
# 295 "Lexer.ml"

  | 6 ->
# 109 "Lexer.mll"
             ( read_string [] (lexbuf.Lexing.lex_curr_p) (lexbuf) )
# 300 "Lexer.ml"

  | 7 ->
# 110 "Lexer.mll"
             ( read_char (lexbuf.Lexing.lex_curr_p) (lexbuf) )
# 305 "Lexer.ml"

  | 8 ->
# 112 "Lexer.mll"
             ( T_lparen )
# 310 "Lexer.ml"

  | 9 ->
# 113 "Lexer.mll"
             ( T_rparen )
# 315 "Lexer.ml"

  | 10 ->
# 114 "Lexer.mll"
             ( T_lbracket )
# 320 "Lexer.ml"

  | 11 ->
# 115 "Lexer.mll"
             ( T_rbracket )
# 325 "Lexer.ml"

  | 12 ->
# 116 "Lexer.mll"
             ( T_comma )
# 330 "Lexer.ml"

  | 13 ->
# 117 "Lexer.mll"
             ( T_semicolon )
# 335 "Lexer.ml"

  | 14 ->
# 118 "Lexer.mll"
             ( T_colon )
# 340 "Lexer.ml"

  | 15 ->
# 119 "Lexer.mll"
             ( T_assignment )
# 345 "Lexer.ml"

  | 16 ->
# 120 "Lexer.mll"
             ( T_equal )
# 350 "Lexer.ml"

  | 17 ->
# 121 "Lexer.mll"
             ( T_less )
# 355 "Lexer.ml"

  | 18 ->
# 122 "Lexer.mll"
             ( T_lesseq )
# 360 "Lexer.ml"

  | 19 ->
# 123 "Lexer.mll"
             ( T_greater )
# 365 "Lexer.ml"

  | 20 ->
# 124 "Lexer.mll"
             ( T_greatereq )
# 370 "Lexer.ml"

  | 21 ->
# 125 "Lexer.mll"
             ( T_noteq )
# 375 "Lexer.ml"

  | 22 ->
# 127 "Lexer.mll"
                        ( incr_linenum lexbuf; lexer lexbuf )
# 380 "Lexer.ml"

  | 23 ->
# 128 "Lexer.mll"
                        ( multiline_comments 0 (lexbuf.Lexing.lex_curr_p) lexbuf )
# 385 "Lexer.ml"

  | 24 ->
let
# 130 "Lexer.mll"
              dig
# 391 "Lexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos lexbuf.Lexing.lex_curr_pos in
# 130 "Lexer.mll"
                  ( T_const (int_of_string dig) )
# 395 "Lexer.ml"

  | 25 ->
# 132 "Lexer.mll"
             ( incr_linenum lexbuf; lexer lexbuf)
# 400 "Lexer.ml"

  | 26 ->
# 133 "Lexer.mll"
             ( lexer lexbuf )
# 405 "Lexer.ml"

  | 27 ->
let
# 134 "Lexer.mll"
         chr
# 411 "Lexer.ml"
= Lexing.sub_lexeme_char lexbuf lexbuf.Lexing.lex_start_pos in
# 134 "Lexer.mll"
             ( error ("invalid character") (lexbuf.Lexing.lex_curr_p) (lexbuf);
                    lexer lexbuf )
# 416 "Lexer.ml"

  | 28 ->
# 136 "Lexer.mll"
            ( T_eof )
# 421 "Lexer.ml"

  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf;
      __ocaml_lex_lexer_rec lexbuf __ocaml_lex_state

and multiline_comments level position lexbuf =
   __ocaml_lex_multiline_comments_rec level position lexbuf 32
and __ocaml_lex_multiline_comments_rec level position lexbuf __ocaml_lex_state =
  match Lexing.engine __ocaml_lex_tables __ocaml_lex_state lexbuf with
      | 0 ->
# 141 "Lexer.mll"
            ( Printf.printf "comments (%d) end\n" level;
              if level = 0 then
                lexer lexbuf
              else multiline_comments (level-1) (position) lexbuf
            )
# 437 "Lexer.ml"

  | 1 ->
# 147 "Lexer.mll"
            ( Printf.printf "comments (%d) start\n" (level+1);
              multiline_comments (level+1) (position) lexbuf
            )
# 444 "Lexer.ml"

  | 2 ->
# 150 "Lexer.mll"
            ( incr_linenum lexbuf; multiline_comments (level) (position) (lexbuf) )
# 449 "Lexer.ml"

  | 3 ->
# 151 "Lexer.mll"
            ( multiline_comments (level) (position) lexbuf )
# 454 "Lexer.ml"

  | 4 ->
# 152 "Lexer.mll"
            ( error ("comments are not closed") (position) (lexbuf);
              T_eof
            )
# 461 "Lexer.ml"

  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf;
      __ocaml_lex_multiline_comments_rec level position lexbuf __ocaml_lex_state

and read_char position lexbuf =
   __ocaml_lex_read_char_rec position lexbuf 40
and __ocaml_lex_read_char_rec position lexbuf __ocaml_lex_state =
  match Lexing.engine __ocaml_lex_tables __ocaml_lex_state lexbuf with
      | 0 ->
# 160 "Lexer.mll"
                      (T_character ('\n'))
# 473 "Lexer.ml"

  | 1 ->
# 161 "Lexer.mll"
                      (T_character ('\t'))
# 478 "Lexer.ml"

  | 2 ->
# 162 "Lexer.mll"
                      (T_character ('\r'))
# 483 "Lexer.ml"

  | 3 ->
# 163 "Lexer.mll"
                      (T_character ('\000'))
# 488 "Lexer.ml"

  | 4 ->
# 164 "Lexer.mll"
                      (T_character ('\\'))
# 493 "Lexer.ml"

  | 5 ->
# 165 "Lexer.mll"
                      (T_character ('\''))
# 498 "Lexer.ml"

  | 6 ->
# 166 "Lexer.mll"
                      (T_character ('\"'))
# 503 "Lexer.ml"

  | 7 ->
let
# 170 "Lexer.mll"
            chr
# 509 "Lexer.ml"
= Lexing.sub_lexeme_char lexbuf lexbuf.Lexing.lex_start_pos in
# 170 "Lexer.mll"
                      ( Printf.printf "character: %c\n" chr; T_character (chr) )
# 513 "Lexer.ml"

  | 8 ->
# 171 "Lexer.mll"
                      ( dispose_char position lexbuf  )
# 518 "Lexer.ml"

  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf;
      __ocaml_lex_read_char_rec position lexbuf __ocaml_lex_state

and dispose_char position lexbuf =
   __ocaml_lex_dispose_char_rec position lexbuf 58
and __ocaml_lex_dispose_char_rec position lexbuf __ocaml_lex_state =
  match Lexing.engine __ocaml_lex_tables __ocaml_lex_state lexbuf with
      | 0 ->
# 174 "Lexer.mll"
                          ( incr_linenum lexbuf; dispose_char position lexbuf)
# 530 "Lexer.ml"

  | 1 ->
# 176 "Lexer.mll"
                          ( error("invalid character") (position) (lexbuf); lexer lexbuf)
# 535 "Lexer.ml"

  | 2 ->
# 178 "Lexer.mll"
                          ( error("Character not terminated") (position) (lexbuf); T_eof )
# 540 "Lexer.ml"

  | 3 ->
# 181 "Lexer.mll"
                          ( dispose_char position lexbuf )
# 545 "Lexer.ml"

  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf;
      __ocaml_lex_dispose_char_rec position lexbuf __ocaml_lex_state

and read_string my_string position_start lexbuf =
   __ocaml_lex_read_string_rec my_string position_start lexbuf 63
and __ocaml_lex_read_string_rec my_string position_start lexbuf __ocaml_lex_state =
  match Lexing.engine __ocaml_lex_tables __ocaml_lex_state lexbuf with
      | 0 ->
# 186 "Lexer.mll"
                      ( read_string (('\n')::my_string) (position_start) (lexbuf) )
# 557 "Lexer.ml"

  | 1 ->
# 187 "Lexer.mll"
                      ( read_string (('\000')::my_string) (position_start) (lexbuf) )
# 562 "Lexer.ml"

  | 2 ->
# 188 "Lexer.mll"
                      ( read_string (('\r')::my_string) (position_start) (lexbuf) )
# 567 "Lexer.ml"

  | 3 ->
# 189 "Lexer.mll"
                      ( read_string (('\t')::my_string) (position_start) (lexbuf) )
# 572 "Lexer.ml"

  | 4 ->
# 190 "Lexer.mll"
                      ( read_string (('\\')::my_string) (position_start) (lexbuf) )
# 577 "Lexer.ml"

  | 5 ->
# 191 "Lexer.mll"
                      ( read_string (('\"')::my_string) (position_start) (lexbuf) )
# 582 "Lexer.ml"

  | 6 ->
let
# 193 "Lexer.mll"
                          word
# 588 "Lexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos lexbuf.Lexing.lex_curr_pos in
# 193 "Lexer.mll"
                               ( let
                                  new_list = ((List.rev (explode (word))) @ (my_string))
                                 in
                                  read_string (new_list) (position_start) (lexbuf)
                               )
# 596 "Lexer.ml"

  | 7 ->
# 199 "Lexer.mll"
                               ( let
                                  str = Bytes.to_string(implode ( List.rev my_string ))
                                 in
                                  Printf.printf "string: %s\n" str;
                                  T_string (str)
                               )
# 606 "Lexer.ml"

  | 8 ->
# 206 "Lexer.mll"
                   ( dispose_string (my_string) (position_start) (lexbuf) )
# 611 "Lexer.ml"

  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf;
      __ocaml_lex_read_string_rec my_string position_start lexbuf __ocaml_lex_state

and dispose_string my_string position_start lexbuf =
   __ocaml_lex_dispose_string_rec my_string position_start lexbuf 74
and __ocaml_lex_dispose_string_rec my_string position_start lexbuf __ocaml_lex_state =
  match Lexing.engine __ocaml_lex_tables __ocaml_lex_state lexbuf with
      | 0 ->
# 209 "Lexer.mll"
                  ( incr_linenum lexbuf; dispose_string (my_string) (position_start) lexbuf )
# 623 "Lexer.ml"

  | 1 ->
# 210 "Lexer.mll"
                  ( error ("strings with many lines not valid") (position_start) (lexbuf); lexer lexbuf )
# 628 "Lexer.ml"

  | 2 ->
# 212 "Lexer.mll"
                  ( error ("string not terminated") (position_start) (lexbuf);  T_eof  )
# 633 "Lexer.ml"

  | 3 ->
# 213 "Lexer.mll"
                  ( dispose_string (my_string) (position_start) (lexbuf) )
# 638 "Lexer.ml"

  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf;
      __ocaml_lex_dispose_string_rec my_string position_start lexbuf __ocaml_lex_state

;;

# 216 "Lexer.mll"
   
   let string_of_token token =
       match token with
       | T_eof   -> "T_eof"
       | T_const _ -> "T_const"
       | T_var _  -> "T_var"
       | T_int   -> "T_int"
       | T_bool  -> "T_bool"
       | T_char  -> "T_char"
       | T_list  -> "T_list"
       | T_nil   -> "T_nil"
       | T_nil_qm -> "T_nil_qm"
       | T_hashtag -> "T_hashtag"
       | T_head   -> "T_head"
       | T_tail   -> "T_tail"
       | T_array  -> "T_array"
       | T_new    -> "T_new"
       | T_skip   -> "T_skip"
       | T_decl   -> "T_decl"
       | T_def    -> "T_def"
       | T_return -> "T_return"
       | T_exit   -> "T_exit"
       | T_ref    -> "T_ref"
       | T_plus   -> "T_plus"
       | T_minus  -> "T_minus"
       | T_mul    -> "T_mul"
       | T_div    -> "T_div"
       | T_mod    -> "T_mod"
       | T_not    -> "T_not"
       | T_and    -> "T_and"
       | T_or     -> "T_or"
       | T_true   -> "T_true"
       | T_false  -> "T_false"
       | T_lparen -> "T_lparen"
       | T_rparen -> "T_rparen"
       | T_lbracket  -> "T_lbracket"
       | T_rbracket  -> "T_rbracket"
       | T_comma   -> "T_comma"
       | T_semicolon  -> "T_semicolon"
       | T_colon  -> "T_colon"
       | T_assignment  -> "T_assignment"
       | T_equal  -> "T_equal"
       | T_less   -> "T_less"
       | T_lesseq  -> "T_lesseq"
       | T_greater  -> "T_greater"
       | T_greatereq  -> "T_greatereq"
       | T_noteq  -> "T_noteq"
       | T_if  -> "T_if"
       | T_else  -> "T_else"
       | T_elsif  -> "T_elsif"
       | T_for  -> "T_for"
       | T_end  -> "T_end"
       | T_string _ -> "T_string"
       | T_character _ -> "T_character"



   let rec parse lexbuf =
      let token = lexer lexbuf in
      Printf.printf "token = %s, lexeme = \"%s\"\n"
        (string_of_token token) (Lexing.lexeme lexbuf);
      if token <> T_eof then parse lexbuf

(*
   let main () =
       let cin =
         if Array.length Sys.argv > 1
         then open_in Sys.argv.(1)
         else stdin
       in
       let lexbuf = Lexing.from_channel cin in
       try parse lexbuf
       with End_of_file -> ()
   let _ = Printexc.print main ()

       (* let rec loop () =
           let token = lexer lexbuf in
           Printf.printf "token = %s, lexeme =\"%s\"\n"
             (string_of_token token) (Lexing.lexeme lexbuf);
           if token <> T_eof then loop () in
       loop ()
       *)
       *)
  
# 730 "Lexer.ml"
