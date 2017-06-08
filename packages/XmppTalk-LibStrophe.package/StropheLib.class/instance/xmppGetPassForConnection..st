xmpp-pass
xmppGetPassForConnection: conn
	^self ffiCall: #( String xmpp_conn_get_pass(xmpp_conn_t * conn) )

