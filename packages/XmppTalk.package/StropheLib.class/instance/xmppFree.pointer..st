xmpp-context
xmppFree: ctx pointer: p
	
	^self ffiCall: #(void xmpp_free(xmpp_ctx_t * ctx, void *p) )