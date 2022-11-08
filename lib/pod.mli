module Container : sig
  module Image_pull_policy : sig
    type t = Always | Never | If_not_present
  end

  module Container_port : sig
    module Protocol : sig
      type t = UDP | TCP | SCTP
    end

    type t

    val create :
      ?host_ip:string ->
      ?host_port:int ->
      ?protocol:Protocol.t ->
      container_port:int ->
      name:string ->
      unit ->
      t
  end

  module Volume_device : sig
    type t

    val create : device_path:string -> name:string -> unit -> t
  end

  module Volume_mount : sig
    type t

    val create :
      ?mount_propogation:string ->
      ?read_only:bool ->
      ?sub_path:string ->
      ?sub_path_expr:string ->
      mount_path:string ->
      name:string ->
      unit ->
      t
  end

  type t

  val create :
    ?image_pull_policy:Image_pull_policy.t ->
    ?ports:Container_port.t list ->
    ?volume_devices:Volume_device.t list ->
    ?volume_mounts:Volume_mount.t list ->
    ?working_dir:string ->
    image:string ->
    name:string ->
    unit ->
    t
end

module Spec : sig
  module Restart_policy : sig
    type t = Always | On_failure | Never
  end

  type t

  val create :
    ?volumes:Volume.t list ->
    ?restart_policy:Restart_policy.t ->
    containers:Container.t list ->
    unit ->
    t
end

type t

val create : metadata:Object_meta.t -> spec:Spec.t -> unit -> t
