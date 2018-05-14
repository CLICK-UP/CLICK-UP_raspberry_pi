
icla :: Classifier(12/0800, -);
iipcla :: IPFilter(allow src port 22);

FromDevice(p1) -> icla;
icla[1] -> Discard;
icla[0] -> Strip(14)
       -> CheckIPHeader
       -> iipcla;
iipcla[1] -> Discard;
iipcla[0] -> Discard;

