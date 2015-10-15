signature MAKE_SCRIPTS  =
sig
  open BasicTypes;  open BoxTypes
  val makeSup:
          style -> bool -> bool -> dist -> node -> box -> hlist
  val makeSub:
          style ->         bool ->         node -> box -> hlist
  val makeSupSub:
          style -> bool -> bool -> dist -> node -> box -> box -> hlist
  val makeScripts:  style -> bool -> bool -> dist ->
                             node -> box option -> box option -> hlist
end  (* signature MAKE_SCRIPTS *)
(*----------*)

structure MakeScripts: MAKE_SCRIPTS  =
struct
  open BasicTypes;  open BoxTypes
  open StyleParams;  open Const
  open Distance;  open General;  open ChangeStyle
  open BasicBox;  open MakeVBox;  open NodeDim

  fun almost_xHeight st  =  (xHeight st * 4) div 5

  fun SupPos0 st isChar hnuc  =
      if  isChar  then  zero  else  hnuc - SupDrop (script st)

  fun SubPos0 st isChar dnuc  =
      if  isChar  then  zero  else  dnuc + SubDrop (script st)

  fun SupPos st cr isChar hnuc dsup  =
      Max [SupPos0 st isChar hnuc,  Sup cr st,    dsup + xHeight st div 4]

  fun SubAlonePos st isChar dnuc hsub  =
      Max [SubPos0 st isChar dnuc,  SubAlone st,  hsub - almost_xHeight st]

  fun SubWithSupPos st isChar dnuc  =
      max (SubPos0 st isChar dnuc,  SubWithSup st)

  val minSupDist  =  almost_xHeight
  fun minSupSubDist st  =  4 * RuleThickness st

  fun SupSubDistances st cr isChar hnuc dsup dnuc hsub  =
  let val supDist  =  SupPos  st  cr   isChar hnuc dsup - dsup
      val subDist  =  SubWithSupPos st isChar dnuc      - hsub
      val Dist     =  supDist + subDist
      val supDist' =  max (supDist,  minSupDist st)
      val Dist'    =  max (Dist,  minSupSubDist st)
  in  (supDist', Dist')  end

  val extendScript  =  extend scriptSpace

  fun makeSup st cr isChar itCorr nucNode supBox  =
  let val shift  =  SupPos st cr isChar (height nucNode) (#depth supBox)
      val scriptNode  =  Box (~shift, supBox)
  in  extend itCorr nucNode @ extendScript scriptNode  end

  fun makeSub st isChar nucNode subBox  =
  let val shift  =  SubAlonePos st isChar (depth nucNode) (#height subBox)
      val scriptNode  =  Box (shift, subBox)
  in  nucNode :: extendScript scriptNode  end

  fun makeSupSub st cr isChar itCorr nucNode supBox subBox  =
  let val dnuc  =   depth nucNode  and  hnuc  =   height nucNode
      val dsup  =  #depth supBox   and  hsub  =  #height subBox
      val distances  =  SupSubDistances st cr isChar hnuc dsup dnuc hsub
      val scriptNode =  above (Box (itCorr, supBox)) distances (Box0 subBox)
  in  nucNode :: extendScript scriptNode  end

  fun makeScripts st cr isChar itCorr nucNode  =
    (fn NONE         =>
        (fn NONE         =>  extend itCorr nucNode
         |  SOME subBox  =>  makeSub st isChar nucNode subBox)
     |  SOME supBox  =>  
        (fn NONE         =>  makeSup st cr isChar itCorr nucNode supBox
         |  SOME subBox  =>  makeSupSub st cr isChar itCorr
                                        nucNode supBox subBox)
    )
end  (* structure MakeScripts *)
