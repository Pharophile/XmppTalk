xmpp-context
xmppContextFree: ctx
	
	^self ffiCall: #(void xmpp_ctx_free(xmpp_ctx_t * ctx) )