open NetKAT.Std

let firewall : policy = 
  <:netkat<
   if (ethType=0x0800 && ipProto = 0x06 && ip4Src = 10.0.0.1 && ip4Dst = 10.0.0.2 && tcpSrcPort = 80 ||
       ethType=0x0800 && ipProto = 0x06 && ip4Src = 10.0.0.2 && ip4Dst = 10.0.0.1 && tcpDstPort = 80 ||
       ethType=0x0800 && ipProto = 0x01 && ip4Src = 10.0.0.3 && ip4Dst = 10.0.0.4 ||
       ethType=0x0800 && ipProto = 0x01 && ip4Src = 10.0.0.4 && ip4Dst = 10.0.0.3 )
   then id
   else drop
  >>
