module Container = struct
  module Image_pull_policy = struct
    type t = Always | Never | If_not_present
  end

  module Container_port = struct
    module Protocol = struct
      type t = UDP | TCP | SCTP
    end

    type t = {
      container_port : int;
      host_ip : string option;
      host_port : int option;
      name : string;
      protocol : Protocol.t option;
    }
    [@@deriving fields]

    let create ?host_ip ?host_port ?protocol ~container_port ~name () =
      Fields.create ~host_ip ~host_port ~protocol ~container_port ~name
  end

  module Volume_device = struct
    type t = { device_path : string; name : string } [@@deriving fields]

    let create ~device_path ~name () = Fields.create ~device_path ~name
  end

  module Volume_mount = struct
    type t = {
      mount_path : string;
      mount_propogation : string option;
      name : string;
      read_only : bool option;
      sub_path : string option;
      sub_path_expr : string option;
    }
    [@@deriving fields]

    let create ?mount_propogation ?read_only ?sub_path ?sub_path_expr
        ~mount_path ~name () =
      Fields.create ~mount_path ~mount_propogation ~name ~read_only ~sub_path
        ~sub_path_expr
  end

  type t = {
    image : string;
    image_pull_policy : Image_pull_policy.t option;
    name : string;
    ports : Container_port.t list option;
    volume_devices : Volume_device.t list option;
    volume_mounts : Volume_mount.t list option;
    working_dir : string option;
  }
  [@@deriving fields]

  let create ?image_pull_policy ?ports ?volume_devices ?volume_mounts
      ?working_dir ~image ~name () =
    Fields.create ~image ~image_pull_policy ~name ~ports ~volume_devices
      ~volume_mounts ~working_dir
end

module Spec = struct
  module Restart_policy = struct
    type t = Always | On_failure | Never
  end

  type t = {
    containers : Container.t list;
    volumes : Volume.t list option;
    restart_policy : Restart_policy.t option;
  }
  [@@deriving fields]

  let create ?volumes ?restart_policy ~containers () =
    Fields.create ~containers ~volumes ~restart_policy
end

type t = { metadata : Object_meta.t; spec : Spec.t } [@@deriving fields]

let create ~metadata ~spec () = Fields.create ~metadata ~spec
