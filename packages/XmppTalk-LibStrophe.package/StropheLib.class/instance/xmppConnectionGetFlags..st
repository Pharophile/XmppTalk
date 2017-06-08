xmpp-flags
xmppConnectionGetFlags: conn
	^self ffiCall: #( long xmpp_conn_get_flags(xmpp_conn_t * conn) )
