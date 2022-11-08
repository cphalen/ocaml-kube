module Host_path_volume_source : sig
  type t

  val create : ?type_:string -> path:string -> unit -> t
end

module Secret_volume_source : sig
  type t

  val create :
    ?default_mode:int ->
    ?items:Key_to_path.t list ->
    ?optional:bool ->
    secret_name:string ->
    unit ->
    t
end

type t

val create :
  ?host_path:Host_path_volume_source.t ->
  ?secret:Secret_volume_source.t ->
  name:string ->
  unit ->
  t
