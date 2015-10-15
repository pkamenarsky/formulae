signature DELIMITER  =
sig
  open BasicTypes;  open BoxTypes
  val varDelimiter:  style -> dist -> delim -> node
  val makeDelimiter: style -> delim -> node
end  (* signature DELIMITER *)
(*----------*)

structure Delimiter: DELIMITER  =
struct
  open BasicTypes;  open BoxTypes
  open Const;  open StyleParams
  fun varDelimiter  _ _ 0   =  Kern nullDelimiterSpace
  |   varDelimiter  _ _ _   =  raise (NotImplemented "varDelimiter")
  fun makeDelimiter st del  =  varDelimiter st (Delim st) del
end  (* structure Delimiter *)
