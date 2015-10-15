Overview of the organization of the source code:

The whole code is distributed into lots of files.
File "Xxx.sml" usually contains a signature "XXX" followed by a structure "Xxx".
The files "XxxTypes.sml" do not contain a signature;
they consist of type declarations in a structure "XxxTypes".
It follows a list of all these files (without the suffix ".sml")
in their proper order, as also given by "all.sml",
together with some (too few) comments.

General:	Some functions of general use.
Powers2:	Some powers of 2.
BasicTypes:	Some basic types (distances, font numbers, etc.)

Distance:	Functions to deal with distances
		(Here as well as in TeX, all distances are integers.
		 A distance of 1 is 2^{-16} pt;
                 or the other way round, 1pt is 2^{16} distance units.)

Size:
FontTypes:
LoadFont:
FontVector:	These files are for reading in font information.

CharInfo:	How to get information about a character.
CharFunctions:	Functions dealing with characters.
Const:		Some important constants.
FontParams:	The font parameters (not read in, but included in the code)
StyleParams:	Access to the font parameters via styles.
BoxTypes:	Boxes, nodes, and so on.  Not very nice, but close to TeX.
BasicBox:	Basic operations on boxes.
NodeDim:	Size of a node.
NodeListDim:	Size of a node list.
GlueCalculation:Calculations involving glue (needed for fractions and bigops)
HListGlue:	Interface of the former.
BoxPack:	Packing node lists into boxes, also dealing with glue.
MakeVBox:	Several methods to form a vertical box.
AxisCenter:	Center a box around the axis (where the fraction strokes lie).

ChangeStyle:	Style changes from formulae to subformulae.
Accent:		Creating math accents (not implemented)
Radical:	Creating root symbols (not implemented)
BasicChar:	Handling characters in formulae 
MakeChar:	Handling them a bit further
MakeLine:	Overline and underline
MakeAtop:	Creating `atops' (like binomial coefficients without parentheses)
MakeFract:	Making fractions
Delimiter:	making big delimiters (not implemented except for a bypass)
GenFraction:    making generalized fractions (i.e. fractions or atops)
MakeLimOp:	adding limits to big operators
MakeScripts:    adding subscripts and superscripts

MathTypes:	types of math formulae (modified compared to TeX)
Kind:		kind = Ord, Bin, Rel, etc.
MathSpace:	translates math units into ordinary units
MathGlue:	defines the standard instances of math glue
Spacing:	spacing between math items
IListTypes:	types of the intermediate form
		(Formulae are set in two passes as Knuth does.
		 The result of the first pass is the intermediate form,
		 while the second yields box terms.)
IListDim:	Sizes in the intermediate form.
ChangeKind:	Changes some instances of Bin into Ord.
MathPenalty:	Penalties in math mode.
Boundaries:	Attaches big delimiters to a formula.
IListTranslate:	The second pass (intermediate form -> box terms)
MathTranslate:	The first pass and everything
		(Quite large.  Could not be broken into smaller units
		 because of mutual recursion.)
Formula:	Interface of the former.

	The next few files are for creating dvi files.
	They use imperative programming.
Out:		Basic output routines (for bytes).
OutHigh:	Output routines for strings and integers.
OutDvi:		Routines which output dvi instructions.
DviState:	State information needed for dvi compression
DviCmd:		High level dvi routines which incorporate dvi compression
		(e.g. by combining subsequent moves into a single move).
SetNode:	Translating atomic nodes into dvi
SetBox:		Translating node lists and boxes into dvi
ShipOut:	Open a dvi file, output a list of lines, and close it.
Input:		Collection of functions which slightly simplify
		the input of formulae.
		(This should be superseded by the future parser of formulae
		 in TeX notation.)
test:		Some sample formulae and test functions.
		(This should be made better!)
