signature CHAR_FUNCTIONS  =
sig
  open BasicTypes;  open FontTypes
  val fontNumber:   style -> family -> fontNr
  val larger:       fontNr * charCode -> charCode
end  (* signature CHAR_FUNCTIONS *)
(*----------*)

structure CharFunctions: CHAR_FUNCTIONS  =
struct
  open Vector
  open BasicTypes;  open FontTypes
  open General;  open FontVector;  open CharInfo
  fun fontNumber st fam  =  sub (fontNumberVector, 4 * famNr fam + styleNr st)
  fun larger  (pair as (_, ch))  =  optVal ch (charLarger pair)
end  (* structure CharFunctions *)
