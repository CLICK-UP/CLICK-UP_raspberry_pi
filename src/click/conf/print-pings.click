elementclass GatewayDevice{
	$device |
	from :: FromDevice($device)
		-> output;
	input -> q :: Queue(1024)
		-> to :: ToDevice($device);
	ScheduleInfo(from .1, to 1);
}

extern_dev :: GatewayDevice(p2);
intern_dev :: GatewayDevice(p1);
rs :: ReadState();
ws :: WriteState();
sc :: SessionCheck();
cla :: Classifier(12/0800 -);

extern_dev -> cla;
cla[1] -> intern_dev;
cla[0] -> rs;
rs[0] -> sc;
sc[1] -> intern_dev;
sc[2] -> Log ->Discard;
sc[0] -> ws -> intern_dev;

intern_dev -> cla;
cla[1] -> extern_dev;
cla[0] -> rs;
rs[0] -> sc;
sc[1] -> extern_dev;
sc[2] -> Log -> Discard;
sc[0] -> ws -> extern_dev;
