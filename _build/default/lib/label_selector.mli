module Requirement : sig
  module Operator : sig
    type t = In | NotIn | Exists | DoesNotExist
  end

  type t

  val create :
    key:string -> operator:Operator.t -> values:string list -> unit -> t
end

type t = {
  match_expressions : Requirement.t list option;
  match_labels : Object.t option;
}

val create :
  ?match_expressions:Requirement.t list -> ?match_labels:Object.t -> unit -> t
