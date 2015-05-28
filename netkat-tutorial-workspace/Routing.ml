open NetKAT.Std
open Firewall

let forwarding : policy =
  <:netkat<
    if switch = 1 then
      (if port = 1 then port := 2
       else if port = 2 then port := 1
       else drop)
    else if switch = 2 then
      (if ethType = 0x0800 && ip4Dst = 10.0.0.1 then port := 1
      else if ethType = 0x0800 && ip4Dst = 10.0.0.2 then port := 2
      else port := 3)
    else if switch = 3 then
      (if ethType = 0x0800 && ip4Dst = 10.0.0.3 then port := 1
      else if ethType = 0x0800 && ip4Dst = 10.0.0.4 then port := 2
      else port := 3)
    else drop
  >>

let _ = run_static <:netkat< $firewall; $forwarding >>
