xmpp-connection
xmppConnectionClone: conn
	^self ffiCall: #(xmpp_conn_t *xmpp_conn_clone(xmpp_conn_t * const conn))
