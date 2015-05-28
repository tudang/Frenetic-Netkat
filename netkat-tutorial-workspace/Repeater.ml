open NetKAT_Types
open Core.Std
open Async.Std
open Async_NetKAT

let repeater : NetKAT_Types.policy = 
  <:netkat<
    if port = 1 then port := 2 + port :=3 + port := 4
    else if port = 2 then port := 1 + port := 3 + port := 4
    else if port = 3 then port := 1 + port := 2 + port := 4
    else if port = 4 then port := 1 + port := 2 + port := 3
    else drop
  >>

let _ = 
  Async_NetKAT_Controller.start (create_static repeater) ();
  never_returns (Scheduler.go ())
