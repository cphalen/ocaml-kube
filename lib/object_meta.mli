type t

val create :
  ?namespace:string ->
  ?labels:Object.t ->
  ?annotations:Object.t ->
  name:string ->
  unit ->
  t
