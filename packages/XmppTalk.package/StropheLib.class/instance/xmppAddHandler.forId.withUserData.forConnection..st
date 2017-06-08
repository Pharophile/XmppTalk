xmpp-handlers
xmppAddHandler: handler forId: id withUserData: userdata forConnection: conn
	"void xmpp_id_handler_add(xmpp_conn_t * const conn,
			 xmpp_handler handler,
			 const char * const id,
			 void * const userdata);;"
	
	^self ffiCall: #(	void xmpp_id_handler_add(xmpp_conn_t * conn, FFICallback handler, String id, void * userdata))