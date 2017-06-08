xmpp-stanza-messages
xmppPresenceNewForContext: ctx
	^self ffiCall: #(xmpp_stanza_t *xmpp_presence_new(xmpp_ctx_t *ctx))