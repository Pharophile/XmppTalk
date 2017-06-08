xmpp-handlers
xmppAddTimedHandler: handler forPeriod: period withUserData: userData forConnection: conn
"void xmpp_timed_handler_add(xmpp_conn_t * const conn,
			    xmpp_timed_handler handler,
			    const unsigned long period,
			    void * const userdata);"
			
	
	^self ffiCall: #(	void xmpp_timed_handler_add(xmpp_conn_t * conn, xmpp_timed_handler handler, unsigned long period, void * userdata))