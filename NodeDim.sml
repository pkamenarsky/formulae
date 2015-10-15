signature NODE_DIM  =
sig
  open BasicTypes
  open BoxTypes
  (* width, height, depth of a node in a horizontal (!) list *)
  val width:  node -> dist
  val height: node -> dist
  val depth:  node -> dist
  (* width and size (height + depth) of a node in a vertical list *)
  val vwidth: node -> dist
  val vsize:  node -> dist
end  (* signature NODE_DIM *)
(*----------*)

structure NodeDim: NODE_DIM  =
struct
  open BasicTypes;  open BoxTypes
  open CharInfo;  open Distance

  fun width (Char info)                   =  charWidth info
  |   width (Box  (_, {width = w, ...}))  =  w
  |   width (Rule {width = w, ...})       =  w
  |   width (Glue {size, ...})            =  size
  |   width (Kern size)                   =  size
  |   width  _                            =  zero

  fun height (Char info)                        =  charHeight info
  |   height (Box  (shift, {height = h, ...}))  =  h - shift
  |   height (Rule {height = h, ...})           =  h
  |   height  _                                 =  zero

  fun depth (Char info)                       =  charDepth info
  |   depth (Box  (shift, {depth = d, ...}))  =  d + shift
  |   depth (Rule {depth = d, ...})           =  d
  |   depth  _                                =  zero

  fun vwidth (Char info)                       =  charWidth info
  |   vwidth (Box  (shift, {width = w, ...}))  =  shift + w
  |   vwidth (Rule {width = w, ...})           =  w
  |   vwidth  _                                =  zero

  fun vsize (Char info)   =   charHeight info  +  charDepth info
  |   vsize (Box  (_, {height, depth, ...}))   =  height + depth
  |   vsize (Rule     {height, depth, ...})    =  height + depth
  |   vsize (Glue {size, ...})                 =  size
  |   vsize (Kern  size)                       =  size
  |   vsize  _                                 =  zero
end  (* structure NodeDim *)
