signature NODE_LIST_DIM  =
sig
  open BasicTypes
  open BoxTypes
  (* Versions of width, height, and depth for node lists *)
  val hlistWidth:  hlist -> dist
  val hlistHeight: hlist -> dist
  val hlistDepth:  hlist -> dist
  val vlistVsize:  vlist -> dist
  val vlistWidth:  vlist -> dist
end  (* signature NODE_LIST_DIM *)
(*----------*)

structure NodeListDim: NODE_LIST_DIM  =
struct
  open General
  open NodeDim
  fun compute f g nl  =  f (map g nl)
  val hlistWidth   =  compute sum width
  val hlistHeight  =  compute Max height
  val hlistDepth   =  compute Max depth
  val vlistWidth   =  compute Max vwidth
  val vlistVsize   =  compute sum vsize
end  (* structure NodeListDim *)
