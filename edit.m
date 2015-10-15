Compiler.Control.Print.printDepth  := 100;
Compiler.Control.Print.printLength := 100;

val script = ref "test.sml"

fun merk f  =  if f <> "" then script := f ^ ".sml" else ()

(* val system  =      System.system   (* 0.93  *)  *)
   val system  =  OS.Process.system   (* 109.2 *)

fun edit fileName  =
(  system ("cp " ^ fileName ^ " @tmp");
   system ("vi " ^ fileName);
   if  system ("cmp -s @tmp " ^ fileName) = 1  then  use fileName  else  ()
)

fun U f  =  ( merk f;  use  (!script) )

fun E f  =  ( merk f;  edit (!script) )

fun A ()  =  edit "all.sml"
