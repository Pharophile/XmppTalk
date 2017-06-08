xmpp-connection
xmppConnectComponentForServer: server onPort: port withCallback: callback andUserData: userdata forConnection: conn
	"^self ffiCall: #(int xmpp_connect_component(xmpp_conn_t * const conn, const char * const server,
                           unsigned short port, xmpp_conn_handler callback,
                           void * const userdata) )"

	^self ffiCall: #(int xmpp_connect_component(xmpp_conn_t * conn, String server, unsigned short port, xmpp_conn_handler callback, void * userdata) )

