module Requirement = struct
  module Operator = struct
    type t = In | NotIn | Exists | DoesNotExist
  end

  type t = { key : string; operator : Operator.t; values : string list }
  [@@deriving fields]

  let create ~key ~operator ~values () = Fields.create ~key ~operator ~values
end

type t = {
  match_expressions : Requirement.t list option;
  match_labels : Object.t option;
}
[@@deriving fields]

let create ?match_expressions ?match_labels () =
  Fields.create ~match_expressions ~match_labels
