open Format
open Error
open Types
open Symbol
open Ast
open Extend

exception Terminate

let take_start (a, _) = a
let take_end   (_, a) = a

let rec typeToString t = match t with
  | TYPE_none         -> "no type"
  | TYPE_int          -> "int"
  | TYPE_bool         -> "bool"
  | TYPE_char         -> "char"
  | TYPE_array (t, _) -> String.concat " " [(typeToString t); "array"]
  | TYPE_list t       -> String.concat " " [(typeToString t); "list"]

                        (*SYNTAX ERRORS*)

let missing_colon_error (startpos, endpos) =
  print_position (err_formatter) (position_context (startpos) (endpos));
  error "Missing colon after function definition.";
  raise Terminate


let missing_end_error (startpos, endpos) =
  print_position (err_formatter) (position_context (startpos) (endpos));
  error "A function has to be terminated by the \"end\" keyword.";
  raise Terminate

let missing_func_name_error (startpos, endpos) =
  print_position (err_formatter) (position_context (startpos) (endpos));
  error "Missing function name";
  raise Terminate

let  missing_lparen_error (startpos, endpos) =
  print_position (err_formatter) (position_context (startpos) (endpos));
  error "Missing left \"(\" parenthesis in header definition";
  raise Terminate

 let missing_rparen_error (startpos, endpos) =
  print_position (err_formatter) (position_context (startpos) (endpos));
  error "Missing right \")\" parenthesis in header definition";
  raise Terminate

let header_definitions_error (startpos, endpos) =
  print_position (err_formatter) (position_context (startpos) (endpos));
  error "Invalid function header definition";
  raise Terminate

let missing_return_expr (startpos, endpos) =
  print_position (err_formatter) (position_context (startpos) (endpos));
  error "Some expression was expected after \"return\" statement";
  raise Terminate

let missing_colon_after_for_error (startpos, endpos) =
  print_position (err_formatter) (position_context (startpos) (endpos));
  error "Missing colon after \"for\" definition.";
  raise Terminate

let missing_end_after_for_error (startpos, endpos) =
  print_position (err_formatter) (position_context (startpos) (endpos));
  error "A \"for\" statement has to be terminated by the \"end\" keyword.";
  raise Terminate

let missing_semic_after_for_error (startpos, endpos) =
  print_position (err_formatter) (position_context (startpos) (endpos));
  error "Missing semicolon in \"for\" statement.";
  raise Terminate

let expr_after_for_error (startpos, endpos) =
  print_position (err_formatter) (position_context (startpos) (endpos));
  error "Missing boolean condition in \"for\" statement.";
  raise Terminate

let missing_semic_after_for_cond_error (startpos, endpos) =
  print_position (err_formatter) (position_context (startpos) (endpos));
  error "Missing semicolon \";\" after \"for\" condition.";
  raise Terminate

let simple_after_for_cond_error (startpos, endpos) =
  print_position (err_formatter) (position_context (startpos) (endpos));
  error "Missing incremental statement(s) after condition in\
	 \"for\" statement.";
  raise Terminate

let missing_end_after_if_error (startpos, endpos) =
  print_position (err_formatter) (position_context (startpos) (endpos));
  error "An \"if\" statement has to be terminated by the \"end\" keyword.";
  raise Terminate

let expr_after_if_error (startpos, endpos) =
  print_position (err_formatter) (position_context (startpos) (endpos));
  error "Boolean expression is expected after \"if\" keyword.";
  raise Terminate

let missing_colon_after_if_expr_error (startpos, endpos) =
  print_position (err_formatter) (position_context (startpos) (endpos));
  error "Missing colon after expression in \"if\" statement.";
  raise Terminate

let missing_colon_after_else_error (startpos, endpos) =
  print_position (err_formatter) (position_context (startpos) (endpos));
  error "Missing colon after \"else\" in \"if\" statement.";
  raise Terminate

let expr_after_elsif_error (startpos, endpos) =
  print_position (err_formatter) (position_context (startpos) (endpos));
  error "Boolean expression is expected after \"elsif\" keyword.";
  raise Terminate

let missing_colon_after_elsif_error (startpos, endpos) =
  print_position (err_formatter) (position_context (startpos) (endpos));
  error "Missing colon after \"elseif\" in \"if\" statement.";
  raise Terminate

let missing_type_error (startpos, endpos) =
  print_position (err_formatter) (position_context (startpos) (endpos));
  error "Valid type expected after \"ref\" keyword.";
  raise Terminate

let syntax_assignment_error (startpos, endpos) =
  print_position (err_formatter) (position_context (startpos) (endpos));
  error "Expression expected in assignment.";
  raise Terminate

let missing_lparen_call_error (startpos, endpos) =
  print_position (err_formatter) (position_context (startpos) (endpos));
  error "Missing left \"(\" parenthesis in function calling";
  raise Terminate

let wrong_function_call (startpos, endpos) =
  print_position (err_formatter) (position_context (startpos) (endpos));
  error "Wrong syntax in function call.";
  raise Terminate

let missing_rparen_call_error (startpos, endpos) =
  print_position (err_formatter) (position_context (startpos) (endpos));
  error "Missing right \")\" parenthesis in function calling";
  raise Terminate

let missing_rbracket_error (startpos, endpos) =
  print_position (err_formatter) (position_context (startpos) (endpos));
  error "Missing ']' character in expression.";
  raise Terminate

let missing_rparen_expr_error (startpos, endpos) =
  print_position (err_formatter) (position_context (startpos) (endpos));
  error "Missing right \")\" parenthesis in expression";
  raise Terminate

let invalid_binary_expr_error (startpos, endpos) =
  print_position (err_formatter) (position_context (startpos) (endpos));
  error "Missing expression in binary operator";
  raise Terminate

let invalid_cmp_expr_error (startpos, endpos) =
  print_position (err_formatter) (position_context (startpos) (endpos));
  error "Missing expression in compare operator";
  raise Terminate

let missing_lbracket_new_error (startpos, endpos) =
  print_position (err_formatter) (position_context (startpos) (endpos));
  error "Missing '[' character in \"new\" expression.";
  raise Terminate

let missing_rbracket_new_error (startpos, endpos) =
  print_position (err_formatter) (position_context (startpos) (endpos));
  error "Missing ']' character in \"new\" expression.";
  raise Terminate

                          (*SEMANTIC ERRORS*)



let atom_error (startpos, endpos) =
  print_position (err_formatter) (position_context (startpos) (endpos));
  error "Invalid atom expression";
  raise Terminate

let array_index_error expr_type (startpos, endpos) =
  print_position (err_formatter) (position_context (startpos) (endpos));
  error "Invalid array indexing: int expected, but found %s instead."
             (typeToString expr_type);
  raise Terminate

let structure_dimension_error (startpos, endpos) =
  print_position (err_formatter) (position_context (startpos) (endpos));
  error "Invalid array expression: too many dimensions.";
  raise Terminate

let assignment_error atom_type expr_type (startpos, endpos) =
  print_position (err_formatter) (position_context (startpos) (endpos));
  error "Assignment error: %s expected, but found %s instead."
             (typeToString atom_type) (typeToString expr_type);
  raise Terminate

let lvalue_error_call (startpos, endpos) =
  print_position (err_formatter) (position_context (startpos) (endpos));
  error "Assignment error: A Function Call cannot be a Lvalue.";
  raise Terminate

let lvalue_error_string (startpos, endpos) =
  print_position (err_formatter) (position_context (startpos) (endpos));
  error "Assignment error: A String cannot be a Lvalue.";
  raise Terminate

let many_arguments (startpos, endpos) =
  print_position (err_formatter) (position_context (startpos) (endpos));
  error "Too many arguments.";
  raise Terminate

let few_arguments (startpos, endpos) =
  print_position (err_formatter) (position_context (startpos) (endpos));
  error "Too few arguments.";
  raise Terminate

let id_error id (startpos, endpos) =
  print_position (err_formatter) (position_context (startpos) (endpos));
  error "Wrong or undeclared identifier: The given identifier \"%s\" does \
   not correspond to a declared variable or a parameter." id;
   raise Terminate

let duplicate_error id (startpos, endpos) =
  print_position (err_formatter) (position_context (startpos) (endpos));
  error "Duplicate identifier: The given identifier \"%s\" corresponds \
   to a declared variable or a parameter." id;
   raise Terminate

let duplicate_fn_error id (startpos, endpos) =
 print_position (err_formatter) (position_context (startpos) (endpos));
 error "Duplicate function: The given function \"%s\" corresponds \
  to an already declared function." id;
  raise Terminate

let fn_id_error id (startpos, endpos) =
    print_position (err_formatter) (position_context (startpos) (endpos));
    error "The given identifier \"%s\" does not correspond to \
  	 a function." id;
    raise Terminate

let main_func_error (startpos, endpos) =
    print_position (err_formatter) (position_context (startpos) (endpos));
    error "Main function is not properely defined, usage: def main():";
    raise Terminate

let parameter_type_error par_type expr_type (startpos, endpos) =
  print_position (err_formatter) (position_context (startpos) (endpos));
  error "Type mismatch for parameter, %s was expected, found %s instead."
    (typeToString par_type) (typeToString expr_type);
  raise Terminate

let error_array_byref (startpos, endpos) =
  print_position (err_formatter) (position_context (startpos) (endpos));
  error "Array cannot be passed by refrence to a function";
  raise Terminate

  let error_list_byref (startpos, endpos) =
    print_position (err_formatter) (position_context (startpos) (endpos));
    error "List cannot be passed by refrence to a function";
    raise Terminate

let return_type_error result_type expr_type (startpos, endpos) =
  print_position (err_formatter) (position_context (startpos) (endpos));
  error "Invalid function return type: %s expected, but found %s instead."
     (typeToString result_type) (typeToString expr_type);
  raise Terminate

let bool_expr_error expr_type (startpos, endpos) =
  print_position (err_formatter) (position_context (startpos) (endpos));
  error "Type mismatch: Boolean expression was expected, but found %s instead."
    (typeToString expr_type);
  raise Terminate

let int_expr_error expr_type (startpos, endpos) =
  print_position (err_formatter) (position_context (startpos) (endpos));
  error "Type mismatch: Integer expression was expected, \
         but found %s instead." (typeToString expr_type);
  raise Terminate

let compare_expr_error expr_type (startpos, endpos) =
  print_position (err_formatter) (position_context (startpos) (endpos));
  error "Invalid compare expression type, \"%s\" found." expr_type;
  raise Terminate

let compare_type_mismatch (startpos, endpos) =
  print_position (err_formatter) (position_context (startpos) (endpos));
  error "Type mismatch: Operator and operand don't agree.\n\
         Comparisons can be performed only between variables \
         of the same, basic type.";
  raise Terminate

let new_type_error  expr_type (startpos, endpos) =
  print_position (err_formatter) (position_context (startpos) (endpos));
  error "Type mismatch: The size of the array to be created \
 	        has to be a valid integer (found \"%s\" instead)."
 	        (typeToString expr_type);
  raise Terminate

let head_list_type_error  expr_type (startpos, endpos) =
  print_position (err_formatter) (position_context (startpos) (endpos));
  error "Type mismatch: Built-in function head can be applied \
         only to lists. Invalid operand: %s."
    (typeToString expr_type);
  raise Terminate

let tail_list_type_error expr_type (startpos, endpos) =
  print_position (err_formatter) (position_context (startpos) (endpos));
  error "Type mismatch: Built-in function tail can be applied \
         only to lists. Invalid operand: %s."
    (typeToString expr_type);
  raise Terminate

let hashtag_content_type_error expr_type list_type (startpos, endpos) =
  print_position (err_formatter) (position_context (startpos) (endpos));
  error "Type miscmatch: Operator and operand don't agree.\n\
         Lists can be constructed only from basic types - \
         %s # %s is invalid for list construction."
    (typeToString list_type) (typeToString expr_type);
  raise Terminate

let hashtag_type_error expr_type (startpos, endpos) =
  print_position (err_formatter) (position_context (startpos) (endpos));
  error "Type mismatch: Built-in function # can be applied \
         only to lists. Invalid operand: %s." (typeToString expr_type);
  raise Terminate

let nilqm_type_error expr_type (startpos, endpos) =
  print_position (err_formatter) (position_context (startpos) (endpos));
  error "Type mismatch: Built-in function nil? can be applied \
         only to lists. Invalid operand: %s." (typeToString expr_type);
  raise Terminate
