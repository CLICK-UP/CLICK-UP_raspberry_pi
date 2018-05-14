#include <click/config.h>
#include <click/error.hh>
#include <click/args.hh>
#include ".hh"
CLICK_DECLS



::() {
	
}

::~() {
	
}

int ::configure(Vector<String>& conf, ErrorHandler* errh)
{
	if (Args(conf, this, errh)

.complete() < 0)
	return -1;
	return 0;
}



void ::push(int i, Packet* p_in)
{
	int n;
	
	
	output(n).push(p);
	
}

CLICK_ENDDECLS
EXPORT_ELEMENT()



