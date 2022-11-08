module Host_path_volume_source = struct
  type t = { path : string; type_ : string option } [@@deriving fields]

  let create ?type_ ~path () = Fields.create ~path ~type_
end

module Secret_volume_source = struct
  type t = {
    default_mode : int option;
    items : Key_to_path.t list option;
    optional : bool option;
    secret_name : string;
  }
  [@@deriving fields]

  let create ?default_mode ?items ?optional ~secret_name () =
    Fields.create ~default_mode ~items ~optional ~secret_name
end

type t = {
  name : string;
  host_path : Host_path_volume_source.t option;
  secret : Secret_volume_source.t option;
}
[@@deriving fields]

let create ?host_path ?secret ~name () = Fields.create ~name ~host_path ~secret
