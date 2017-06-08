xmpp-uuid
xmppUuidGenForContext: ctx
	^ self ffiCall: #(String xmpp_uuid_gen(xmpp_ctx_t *ctx))