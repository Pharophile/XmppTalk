xmpp-jid
xmppConnectionGetJid: conn
	^self ffiCall: #( String xmpp_conn_get_jid(xmpp_conn_t * conn) )
