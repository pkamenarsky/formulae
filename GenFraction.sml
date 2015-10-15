signature GEN_FRACTION  =
sig
  open BasicTypes;  open BoxTypes
  val makeGenFraction:
      style -> dist option -> delim -> delim -> box -> box -> box
end  (* signature GEN_FRACTION *)
(*----------*)

structure GenFraction: GEN_FRACTION  =
struct
  open BasicTypes;  open BoxTypes
  open General;  open Distance;  open StyleParams
  open Delimiter;  open BoxPack
  open MakeAtop;  open MakeFract

  fun makeGenFraction st thickness left right numBox denBox  =
  let val width    =  max (#width numBox, #width denBox)
      val numBox'  =  rebox width numBox  and  denBox'  =  rebox width denBox
      val th       =  optVal (RuleThickness st) thickness
      val middle   =  if  th = zero  then  makeAtop  st numBox' denBox'
                                     else  makeFract st th width numBox' denBox'
      val leftNode   =  makeDelimiter st left
      val rightNode  =  makeDelimiter st right
  in  boxList [leftNode, middle, rightNode]  end
end  (* structure GenFraction *)
