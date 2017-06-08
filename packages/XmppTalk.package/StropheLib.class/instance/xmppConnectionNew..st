xmpp-connection
xmppConnectionNew: ctx
	^self ffiCall: #(xmpp_conn_t * xmpp_conn_new(xmpp_ctx_t * ctx))
