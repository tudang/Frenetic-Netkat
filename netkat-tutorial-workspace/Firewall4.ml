open NetKAT.Std
open Forwarding


let p : policy  = 
  <:netkat<
   if (ethType=0x0800 && ipProto = 0x06 && ip4Src = 10.0.0.1 && ip4Dst = 10.0.0.2 && tcpSrcPort = 80 ||
       ethType=0x0800 && ipProto = 0x06 && ip4Src = 10.0.0.2 && ip4Dst = 10.0.0.1 && tcpDstPort = 80 )
   then id
   else drop
  >>

let q : policy =
  <:netkat<
   if (ethType=0x0800 && ipProto = 0x01 && ip4Src = 10.0.0.3 && ip4Dst = 10.0.0.4 ||
       ethType=0x0800 && ipProto = 0x01 && ip4Src = 10.0.0.4 && ip4Dst = 10.0.0.3 )
   then id
   else drop
  >>

let firewall : policy = 
  <:netkat<
    ($p + $q); $forwarding 
  >>
  

let _ = run_static firewall
