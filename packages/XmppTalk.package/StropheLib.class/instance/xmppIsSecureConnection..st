xmpp-connection
xmppIsSecureConnection: conn
	^self ffiCall: #(int xmpp_conn_is_secured(xmpp_conn_t * conn))

