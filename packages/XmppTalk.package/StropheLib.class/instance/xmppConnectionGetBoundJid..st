xmpp-jid
xmppConnectionGetBoundJid: conn
	^self ffiCall: #( const char *xmpp_conn_get_bound_jid(xmpp_conn_t * conn) )

