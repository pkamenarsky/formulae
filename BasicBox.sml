signature BASIC_BOX  =
sig
  open BasicTypes
  open BoxTypes
  val rule: dist -> dist -> node (* height and width *)
  val ssGlue:   glueSpec
  val emptyBox: box
  val hbox: dim -> hlist -> box  (* constructs hbox with given dimensions *)
  val vbox: dim -> vlist -> box  (* constructs vbox with given dimensions *)
  val extend: dist -> node -> hlist     (* extends to the right *)
end  (* signature BASIC_BOX *)
(*----------*)

structure BasicBox: BASIC_BOX  =
struct
  open BasicTypes;  open BoxTypes
  open Distance

  fun rule h w  =  Rule {height = h, depth = zero, width = w}

  val ssGlue:  glueSpec   =
  let val fil1  =  (one, fil)
  in  {size = zero,  stretch = fil1,  shrink = fil1}  end

  (* makebox: boxkind -> dim -> node list -> box
        constructs a box of given kind with given dimensions and content *)
  fun makebox boxkind {height = h, depth = d, width = w} nl  =
          {kind    = boxkind,
           height  = h,   depth = d,  width = w,
           content = nl,  glueParam = natural}

  (* hbox: dim -> hlist -> box
        constructs a hbox with given dimensions and content *)
  val hbox  =  makebox HBox

  (* vbox: dim -> vlist -> box
        constructs a vbox with given dimensions and content *)
  val vbox  =  makebox VBox

  val emptyBox : box  =
      hbox  {width = zero,  depth = zero,  height = zero}  []

  fun extend dist node  =
  let val extension  =  if  dist = zero  then  []  else  [Kern dist]
  in  node :: extension  end

end  (* structure BasicBox *)
