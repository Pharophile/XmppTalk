xmpp-connection
xmppDisableTlsForConnection: conn
	^self ffiCall: #(void xmpp_conn_disable_tls(xmpp_conn_t * const conn))
