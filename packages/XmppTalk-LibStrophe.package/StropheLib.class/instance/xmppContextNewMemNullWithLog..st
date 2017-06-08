xmpp-context
xmppContextNewMemNullWithLog: log	
	^self ffiCall: #(xmpp_ctx_t *xmpp_ctx_new( nil, xmpp_log_t * log) )