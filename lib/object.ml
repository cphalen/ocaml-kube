open Core

type t = string String.Map.t

let empty = String.Map.empty
let of_map = Fn.id
let set = Map.set
let remove t ~key = Map.remove t key
