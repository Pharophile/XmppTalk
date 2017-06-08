xmpp-connection
xmppConnectionRelease: conn
	^self ffiCall: #(int xmpp_conn_release(xmpp_conn_t * conn))