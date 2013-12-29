

type paragraph =
  | Normal of par_text
  | Pre of string * string option
  | Heading of int * par_text
  | Quote of paragraph list
  | Ulist of paragraph list * paragraph list list
  | Olist of paragraph list * paragraph list list

and par_text = text list

and text =
  | Text of string
  | Emph of string
  | Bold of string
  | Struck of par_text
  | Code of string
  | Link of href
  | Anchor of string
  | Image of img_ref

and href = { href_target : string; href_desc : string; }

and img_ref = { img_src : string; img_alt : string; }

and par_list = paragraph list with sexp


val string_of_paragraph : paragraph -> string
val string_of_paragraphs : paragraph list -> string

val parse_lines : string list -> paragraph list
val parse_text : string -> paragraph list
