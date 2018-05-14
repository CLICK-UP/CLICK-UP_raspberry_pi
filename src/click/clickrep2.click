//elementclass GatewayDevice{
//	$device |
//	from :: FromDevice($device)
//	  -> output;
//	input -> q :: Queue(1024)
//	  -> to :: ToDevice($device);
//	ScheduleInfo(from .1, to 1);
//}

//extern_dev :: GatewayDevice(p2);
//intern_dev :: GatewayDevice(p1);
icla :: Classifier(12/0800, -);
//iipcla :: IPClassifier(tcp, -);
//eipcla :: IPClassifier(tcp, -);
ifi :: Firewall;
to_extern :: Queue -> ToDevice(p2);

FromDevice(p1) -> icla;
icla[1] -> to_extern
icla[0] -> Strip(14)
	-> CheckIPHeader
	-> ifi;
//iipcla[1] -> EtherEncap(0x0800, fa:fe:ca:5d:97:6c, ee:43:35:3d:55:7c) -> Queue -> ToDevice(p2);
//iipcla[0] -> EtherEncap(0x0800, fa:fe:ca:5d:97:6c, ee:43:35:3d:55:7c) -> Queue -> ToDevice(p2);
//iipcla[0] -> ifi;
ifi[1] -> Log -> Discard;
ifi[0] -> EtherEncap(0x0800, fa:fe:ca:5d:97:6c, ee:43:35:3d:55:7c) ->to_extern

//extern_dev -> intern_dev;
//FromDevice(p1) -> Queue(2048) -> ToDevice(p2);
FromDevice(p2) -> Queue(2048) -> ToDevice(p1);
