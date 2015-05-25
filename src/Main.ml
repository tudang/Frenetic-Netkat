open Async.Std
open Core.Std
open Async_NetKAT
open Async_NetKAT_Controller


let start filename () = 
    let static = Async_NetKAT.Policy.create_from_file filename in
    ignore(Async_NetKAT_Controller.start static ())

let command = 
    Command.basic
    ~summary:"Controller"
    ~readme:(fun () -> "More info")
    Command.Spec.(empty +> anon ("filename" %: string))
    start

let main () : unit =
    Command.run ~version:"1.0" ~build_info:"RWO" command

let () =
    never_returns (Scheduler.go_main ~main ())
