xmpp-connection
xmppConnectRawForAltdomain: altdomain onAltPort: altPort withCallback: callback andUserData: userdata forConnection: conn
	"^self ffiCall: #(int xmpp_connect_raw(xmpp_conn_t * const conn,
                     const char * const altdomain,
                     unsigned short altport,
                     xmpp_conn_handler callback,
                     void * const userdata))"

	^self ffiCall: #(int xmpp_connect_raw(xmpp_conn_t * conn, String altdomain, unsigned short altport, xmpp_conn_handler callback, void * userdata))