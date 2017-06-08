xmpp-connection
xmppDisconnectForConnection: conn
	^self ffiCall: #(void xmpp_disconnect(xmpp_conn_t * conn))
