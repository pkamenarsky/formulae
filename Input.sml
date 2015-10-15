signature INPUT  =
sig
  open BasicTypes;  open MathTypes
  val trans      : string -> mlist
  val overline   : mlist -> noad
  val underline  : mlist -> noad
  val fraction   : mlist -> mlist -> noad
  val atop       : mlist -> mlist -> noad
  val sup        : mlist -> mlist -> noad
  val sub        : mlist -> mlist -> noad
  val supsub     : mlist -> mlist -> mlist -> noad
  val sum        : mlist option -> mlist option -> noad
  val int        : mlist option -> mlist option -> noad
  val math       : kind -> mlist -> noad
  val style      : style -> noad
  val choice     : mlist -> mlist -> mlist -> mlist -> noad
end
(*----------*)

structure Input: INPUT  =
struct
  open BasicTypes;  open MathTypes
  open Char

  val sumsym    =  MathChar (Op,    EX,  80)
  val intsym    =  MathChar (Op,    EX,  82)

  fun sym ch  =  
  if  isAlpha ch                      then  (Ord,   MI, ord ch)  else
  if  isDigit ch  orelse  ch = #"@"   then  (Ord,   RM, ord ch)  else
  if  ch = #"("   orelse  ch = #"["   then  (Open,  RM, ord ch)  else
  if  ch = #")"   orelse  ch = #"]"   then  (Close, RM, ord ch)  else
  if  ch = #"="   orelse  ch = #":"   then  (Rel,   RM, ord ch)  else
  if  ch = #"<"   orelse  ch = #">"   then  (Rel,   MI, ord ch)  else
  if  contains  "!?;"  ch             then  (Punct, RM, ord ch)  else
  case  ch  of
    #","  =>  (Punct, MI, 59)
  | #"+"  =>  (Bin,   RM, 43)
  | #"-"  =>  (Bin,   SY,  0)
  | #"*"  =>  (Bin,   SY,  3)
  | #"."  =>  (Bin,   SY,  1)
  | _     =>  raise (NotImplemented ("Character " ^ toString ch))

  fun trans str  =  map (MathChar o sym) (String.explode str)

  val overline   =  Overline
  val underline  =  Underline

  fun fraction num den  =
  GenFraction {num = num, den = den, thickness = NONE,   left = 0, right = 0}

  fun atop top bot  =
  GenFraction {num = top, den = bot, thickness = SOME 0, left = 0, right = 0}

  fun sup    a b    =  Script {nucleus = a, supOpt = SOME b, subOpt = NONE}
  fun sub    a b    =  Script {nucleus = a, supOpt = NONE,   subOpt = SOME b}
  fun supsub a b c  =  Script {nucleus = a, supOpt = SOME b, subOpt = SOME c}

  fun bigop sym subopt supopt  =
  BigOp (default, {nucleus = [sym], supOpt = supopt, subOpt = subopt})

  val sum  =  bigop sumsym
  val int  =  bigop intsym

  fun math kind ml  =  Kind (kind, ml)

  val style = Style

  fun choice d t s ss  =  Choice (fn D => d | T => t | S => s | SS => ss)

end
