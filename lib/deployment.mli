module Spec : sig
  type t

  val create :
    ?replicas:int -> selector:Label_selector.t -> template:Pod.t -> unit -> t
end

type t

val create : metadata:Object_meta.t -> spec:Spec.t -> unit -> t
