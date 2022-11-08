open Core

let redis_deployment =
  let label = String.Map.of_alist_exn [ ("app", "redis") ] |> Object.of_map in
  Deployment.create
    ~metadata:(Object_meta.create ~name:"redis-deployment" ())
    ~spec:
      (Deployment.Spec.create ~replicas:1
         ~selector:(Label_selector.create ~match_labels:label ())
         ~template:
           (Pod.create
              ~metadata:(Object_meta.create ~labels:label ~name:"redis" ())
              ~spec:
                (Pod.Spec.create
                   ~containers:
                     [
                       Pod.Container.create ~image:"redis:latest" ~name:"redis"
                         ();
                     ]
                   ())
              ())
         ())
    ()
