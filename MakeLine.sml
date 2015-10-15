signature MAKE_LINE  =
sig
  open BasicTypes;  open BoxTypes
  val makeOver:   style -> box -> box
  val makeUnder:  style -> box -> box
end  (* signature MAKE_LINE *)
(*----------*)

structure MakeLine: MAKE_LINE  =
struct
  open BasicTypes;  open BoxTypes
  open StyleParams;  open BasicBox;  open MakeVBox

  fun lineDist st  =  3 * RuleThickness st
  fun linePad  st  =      RuleThickness st

  fun makeLine constrVBox st box  =
  let val w  =  #width (box: box)
      val line  =  rule (RuleThickness st) w
  in  constrVBox w box [Kern (lineDist st),  line,  Kern (linePad st)]  end

  val makeOver   =  makeLine upVBox
  val makeUnder  =  makeLine dnVBox
end  (* structure MakeLine *)
