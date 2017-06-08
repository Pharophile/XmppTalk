xmpp-connection
xmppOpenStreamDefaultForConnection: conn
	^self ffiCall: #(int xmpp_conn_open_stream_default(xmpp_conn_t * conn))
