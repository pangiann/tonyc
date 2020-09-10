open Lexer
open Lexing
open Ast
open Format
open Sem
open Symbol
open CodeGen
open Filename
open String
open Arg

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

        try
          parse_with_error lexbuf;
          (*print_ast !ast_tree;*)
          sem_ast   !ast_tree;
          Printf.printf("helloooo\n");
          gen_maybe_program !ast_tree;
          exit 0

        with
          | PrintErrors.Terminate -> Printf.printf("Terminate exception caught\n");
          | Pervasives.Exit -> Printf.printf("Exit exception caught\n");
          | Sem.TypeError -> Printf.printf("TypeError exception caught\n");

(*
(* MODIFY ACCORDINGLY IF NEEDED *)
let llc_exe = "llc"
let clang_exe = "clang"

let o_flag = ref false
let f_flag = ref false
let i_flag = ref false
let l_flag = ref false
let anon_flag = ref false
let inp_name = ref None

let usage_msg = sprintf "Usage: %s [-O] [-f|-i| [-l] filename]" Sys.argv.(0)
let parse_list =
    [("-O", Set o_flag, "optimization flag");
    ("-l", Tuple [Set l_flag; Clear i_flag; Clear f_flag],
    "pass file.s to ./as-ld.py : clang file.s /lib/lib.a -o file");
    ("-f", Tuple [Set f_flag; Clear anon_flag; Clear i_flag],
    "emit target code to stdout, from stdin");
    ("-i", Tuple [Set i_flag; Clear anon_flag; Clear f_flag],
    "emit intermediate code to stdout, from stdin")]

let main =
    let anon_f = fun s ->
        anon_flag := true; i_flag := false; f_flag := false; inp_name := Some s
    in parse parse_list anon_f usage_msg;
    if not (!f_flag || !i_flag || !anon_flag) then
    begin
        print_endline usage_msg; exit 1
    end;
    let infile_prefix, input_channel =
        if (!anon_flag) then
            match !inp_name with
            | None -> print_string (usage_msg ^ "\n"); exit 1
            | Some n ->
                try
                    let prefix s =
                        let s = Filename.basename s in
                        if (length (Filename.extension s) < 2) then begin
                            printf "Input file must be <name.extension>\n"; exit 1
                        end else Filename.remove_extension s
                    in
                    let a = prefix n in
                    let b = open_in n in
                    a,b
                with Sys_error _ ->
                    printf "Failed to open input file: %s\n" n;
                    exit 1
        else "stdin", stdin
    in

    let lexbuf = Lexing.from_channel input_channel in
      (try Parser.program Lexer.lexer lexbuf
       with PrintErrors.Terminate ->
            printf "You have an error, aborting...\n";
            exit 1
      );
      begin
        let () = try sem_ast !ast_tree
                 with
                  | PrintErrors.Terminate -> exit 1
                  | Pervasives.Exit ->  exit 1
                  | Sem.TypeError -> exit 1

        in
        let () = try  CodeGen.gen_maybe_program !ast_tree
                 with Terminate -> exit 1
        in
        let outp_name = infile_prefix ^ ".ll" in
        Llvm.print_module outp_name the_module;
        if (!anon_flag) then
        begin
            Printf.printf "fucklooo\n";
            let cmd = Printf.sprintf "%s %s -o %s" llc_exe outp_name (infile_prefix ^ ".s") in
            ignore(Unix.system cmd);
            let cmd2 = Printf.sprintf "%s -o %s %s lib.a -lgc" clang_exe  infile_prefix (infile_prefix ^ ".s") in
            ignore(Unix.system cmd2);
            (*)
            let cmd = Printf.sprintf "%s %s" "./as-ld.py" (infile_prefix ^ ".s") in
            ignore(Unix.system cmd)
            *)

            close_in input_channel
        end
        else if (!i_flag) then
            Printf.printf "hellooo\n";
            let cmd = Printf.sprintf "cat %s" outp_name in
            ignore(Unix.system cmd);
        exit 0
    end
*)
