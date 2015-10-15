signature CONST  =
sig
  open BasicTypes
  val delimiterFactor:    int		(* in units of 1000 *)
  val delimiterShortfall: dist
  val nullDelimiterSpace: dist
  val scriptSpace:        dist
  val infPenalty:         penalty
  val relPenalty:         penalty
  val binopPenalty:       penalty
end  (* signature CONST *)
(*----------*)

structure Const: CONST  =
struct
  open BasicTypes
  open Distance
  val delimiterFactor      =  901               (* units of 1000 *)
  val delimiterShortfall   =  distReal 5.0      (* 5.0 pt *)
  val nullDelimiterSpace   =  distReal 1.2      (* 1.2 pt *)
  val scriptSpace          =  distReal 0.5      (* 0.5 pt *)
  val infPenalty           =  10000
  val relPenalty           =  500
  val binopPenalty         =  700
end  (* structure Const *)
