open Lexer
open Lexing
open Ast
open Format
open Sem
open Symbol
open CodeGen

let print_position outx lexbuf =
    let pos = lexbuf.lex_curr_p in
    Printf.printf outx "%s:%d:%d" pos.pos_fname
    pos.pos_lnum (pos.pos_cnum - pos.pos_bol + 1)


let error  lexbuf =
  let pos = lexbuf.Lexing.lex_curr_p in
      Printf.printf "[--------------------------]\nline: %d char: %d -> syntaxError\n[--------------------------]\n" (pos.pos_lnum) (pos.pos_cnum - pos.pos_bol)


let parse_with_error lexbuf =
    try Parser.program Lexer.lexer lexbuf with
      Parsing.Parse_error ->
            error lexbuf;
            exit (-1)


let pangiann = ref 0

let main =
    let cin =
      (if Array.length Sys.argv > 1 then
         open_in Sys.argv.(1)
       else
         stdin)
    in
      let lexbuf = Lexing.from_channel cin in
        parse_with_error lexbuf;
        (*print_ast !ast_tree;*)
        sem_ast   !ast_tree;
        Printf.printf("helloooo\n");
        gen_maybe_program !ast_tree;
        exit 0
