signature FORMULA  =
sig
  open BoxTypes;  open MathTypes
  val inlineFormula:   mlist -> hlist
  val displayFormula:  mlist -> hlist
end  (* signature FORMULA *)
(*----------*)

structure Formula: FORMULA  =
struct
  open BasicTypes
  open MathTranslate

  val displayFormula  =  MListToHList D false false
  val inlineFormula   =  MListToHList T false true
end  (* structure Formula *)
