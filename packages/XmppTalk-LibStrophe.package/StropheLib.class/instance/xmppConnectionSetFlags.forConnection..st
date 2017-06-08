xmpp-flags
xmppConnectionSetFlags: flags forConnection: conn
	^self ffiCall: #( int xmpp_conn_set_flags(xmpp_conn_t * conn, long flags) )