signature BASIC_CHAR  =
sig
  open BasicTypes;  open BoxTypes
  val basicChar:  style -> bool -> family -> charCode -> node * dist
end  (* signature BASIC_CHAR *)
(*----------*)

structure BasicChar: BASIC_CHAR  =
struct
  open BasicTypes;  open BoxTypes
  open CharInfo;  open CharFunctions

  fun basicChar st enlarge fam ch  =
  let val fontNr  =  fontNumber st fam
      val ch'     =  if  enlarge  then  larger (fontNr, ch)  else  ch
      val info    =  (fontNr, ch')
  in  (Char info, charItalic info)  end
end  (* structure BasicChar *)
