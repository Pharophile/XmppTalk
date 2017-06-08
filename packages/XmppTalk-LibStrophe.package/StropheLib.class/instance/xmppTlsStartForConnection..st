xmpp-connection
xmppTlsStartForConnection: conn
	^self ffiCall: #(int xmpp_conn_tls_start(xmpp_conn_t * conn))
