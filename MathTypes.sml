structure MathTypes  =
struct
  open BasicTypes
  open BoxTypes
  datatype kind = Ord | Op | Bin | Rel | Open | Close | Punct | Inner | None
  datatype limits  =  default | yes | no
  datatype space   =  SKern of dist  |  SGlue of glueSpec
  type mathSpace   =  {isMu: bool, always: bool, entry: space}
  datatype noad  =
    MathChar  of  kind * family * charCode
  | Radical   of  delim * mlist
  | Accent    of  family * charCode * mlist
  | VCenter   of  mlist
  | Overline  of  mlist
  | Underline of  mlist
  | GenFraction  of  genfraction
  | LeftRight    of  delim * mlist * delim
  | Script of  script
  | BigOp  of  limits * script
  | SubBox of  box
  | MList  of  mlist
  | Kind   of  kind * mlist
  (* `MRule' and some other guys omitted *)
  | MPen   of  penalty
  | MSpace of  mathSpace
  | Style  of  style
  | Choice of  style -> mlist
  withtype  mlist  =  noad list
  and  genfraction = {num: mlist, den: mlist, thickness: dist option,
                                           (* no thickness -> default value *)
                      left: delim, right: delim}
  and  script = {nucleus: mlist, supOpt: mlist option, subOpt: mlist option}
end  (* structure MathTypes *)
