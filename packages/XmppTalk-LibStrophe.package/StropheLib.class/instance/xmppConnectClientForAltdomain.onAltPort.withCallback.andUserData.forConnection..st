xmpp-connection
xmppConnectClientForAltdomain: altdomain onAltPort: altport withCallback: callback andUserData: userdata forConnection: conn
	"^self ffiCall: #(int xmpp_connect_client(xmpp_conn_t * const conn, 
			  const char * const altdomain,
			  unsigned short altport,
			  xmpp_conn_handler callback,
			  void * const userdata))
with 	
		typedef void (*xmpp_conn_handler)(xmpp_conn_t * const conn, 
				  const xmpp_conn_event_t event,
				  const int error,
				  xmpp_stream_error_t * const stream_error,
				  void * const userdata);	
			"

	^self ffiCall: #(int xmpp_connect_client(xmpp_conn_t * conn, String altdomain, ushort altport,  FFICallback callback, void * userdata))
