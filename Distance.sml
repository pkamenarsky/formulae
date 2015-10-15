signature DISTANCE  =
sig
  open BasicTypes
  val zero :  dist
  val one  :  dist
  val half :  dist -> dist
  val realMult :  real * dist -> dist   (* multiply distance with real factor *)
  val distInt  :  int -> dist           (* integer to distance *)
  val distRat  :  int * int -> dist     (* fraction to distance *)
  val distReal :  real -> dist          (* decimal fraction to distance *)
end
(*----------*)

structure Distance: DISTANCE  =
struct
  open BasicTypes
  open Powers2;  open General
  val zero =  0
  val one  =  two16       (* 2^16 *)
  fun half  d  =  d div 2
  fun realMult (r, d)  =  round (r * real d)
  fun distInt n  =  n * one
  fun distRat (num, den)  =  (one * num) div den
  fun distReal r  =  realMult (r, one)
end
