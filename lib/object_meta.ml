open Core

type t = {
  name : string;
  namespace : string option;
  labels : Object.t option;
  annotations : Object.t option;
}
[@@deriving fields]

let create ?namespace ?labels ?annotations ~name () =
  Fields.create ~name ~namespace ~labels ~annotations
