open Core

type t = { key : string; mode : int option; path : string } [@@deriving fields]

let create ?mode ~key ~path () = Fields.create ~key ~mode ~path
