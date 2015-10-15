signature BOUNDARIES  =
sig
  open BasicTypes;  open BoxTypes;  open IListTypes
  val makeBoundaries:    style -> dist -> dist -> delim -> delim -> node * node
  val attachBoundaries:  style -> delim -> delim -> ilist -> ilist
end  (* signature BOUNDARIES *)
(*----------*)

structure Boundaries: BOUNDARIES  =
struct
  open BasicTypes;  open BoxTypes;  open IListTypes
  open Const;  open StyleParams;  open Delimiter;  open IListDim
  fun delimiterSize axisDist  =
      max ((axisDist div 500) * delimiterFactor,   (* units of 1000! *)
           2 * axisDist - delimiterShortfall)

  fun makeBoundaries st height depth left right  =
  let val axh        =  AxisHeight st
      val axisDist   =  max (height - axh, depth + axh)
      val delSize    =  delimiterSize axisDist
      val leftNode   =  varDelimiter st delSize left
      val rightNode  =  varDelimiter st delSize right
  in  (leftNode, rightNode)  end

  fun attachBoundaries st left right il  =
  let val height = ilistHeight il  and  depth = ilistDepth il
      val (leftNode, rightNode)  =  makeBoundaries st height depth left right
      fun makeIList kind node  =  [INoad (kind, [node])]
  in  makeIList Open leftNode  @  il  @  makeIList Close rightNode  end
end  (* structure Boundaries *)
