module Spec = struct
  type t = {
    replicas : int option;
    selector : Label_selector.t;
    template : Pod.t;
  }
  [@@deriving fields]

  let create ?replicas ~selector ~template () =
    Fields.create ~replicas ~selector ~template
end

type t = { metadata : Object_meta.t; spec : Spec.t } [@@deriving fields]

let create ~metadata ~spec () = Fields.create ~metadata ~spec
