open Core

type t

val of_map : string String.Map.t -> t
val empty : t
val set : t -> key:string -> data:string -> t
val remove : t -> key:string -> t
