xmpp-handlers
xmppAddHandler: handler forNs: ns forName: name forType: type withUserData: userdata forConnection: conn
	"void xmpp_handler_add(
	           xmpp_conn_t * const conn,
		      xmpp_handler handler,
		      const char * const ns,
		      const char * const name,
		      const char * const type,
		      void * const userdata);"
		
		
	"^self ffiCall: #(void xmpp_handler_add(xmpp_conn_t * conn, FFICallback handler,  String ns,  String name,  String type, void * userdata))"
	^ self ffiCall: #(void xmpp_handler_add(
	          xmpp_conn_t * conn,
		      FFICallback handler,
		      String ns,
		      String name,
		      String type,
		      void * userdata) )
		