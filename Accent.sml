signature ACCENT  =
sig
  open BasicTypes;  open BoxTypes
  val makeAccent:  style -> family -> charCode -> box -> box
end  (* signature ACCENT *)
(*----------*)

structure Accent: ACCENT  =
struct
  open BasicTypes;  open BoxTypes
  fun makeAccent  st fam ch box  =  raise (NotImplemented "makeAccent")
end  (* structure Accent *)
