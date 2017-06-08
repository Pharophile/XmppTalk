xmpp-context
xmppContextNew: mem log: log	
	^self ffiCall: #(xmpp_ctx_t *xmpp_ctx_new(xmpp_mem_t * mem, xmpp_log_t * log) )