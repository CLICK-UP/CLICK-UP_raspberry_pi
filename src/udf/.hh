#ifndef _H
#define _H
#include <click/element.hh>

CLICK_DECLS

class  : public Element {

public:	
	();
	~();
	
	const char* class_name() const { return ""; }
	const char* port_count() const { return ""; }
	const char* processing() const { return PUSH; }
	const char* flow_code()  const { return "x/y"; }
	
	int configure(Vector<String>& conf, ErrorHandler* errh);
	void push(int i, Packet* p);

	

private:
	
};

CLICK_ENDDECLS

#endif