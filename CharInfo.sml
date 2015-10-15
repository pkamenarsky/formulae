signature CHAR_INFO  =
sig
  open BasicTypes;  open FontTypes
  val charWidth  : fontNr * charCode -> dist
  val charHeight : fontNr * charCode -> dist
  val charDepth  : fontNr * charCode -> dist
  val charItalic : fontNr * charCode -> dist
  val charLarger : fontNr * charCode -> charCode option
end  (* signature CHAR_INFO *)
(*----------*)

structure CharInfo: CHAR_INFO  =
struct
  open Vector
  infix 8 sub
  open BasicTypes;  open FontTypes
  open FontVector

  fun charInfo (fontNr, ch)  =  (fontVector sub fontNr sub ch): charInfo

  fun charWidth   pair  =  #width  (charInfo pair)
  fun charHeight  pair  =  #height (charInfo pair)
  fun charDepth   pair  =  #depth  (charInfo pair)
  fun charItalic  pair  =  #itCorr (charInfo pair)
  fun charLarger  pair  =  #larger (charInfo pair)
end  (* structure CharInfo *)
