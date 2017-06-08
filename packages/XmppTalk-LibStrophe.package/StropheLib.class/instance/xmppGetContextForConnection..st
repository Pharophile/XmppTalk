xmpp-connection
xmppGetContextForConnection: conn
	^self ffiCall: #(xmpp_ctx_t *xmpp_conn_get_context(xmpp_conn_t * conn))