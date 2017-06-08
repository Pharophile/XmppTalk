xmpp-stanza-messages
xmppIqNewOfType: type forContext: ctx withId: id
	^self ffiCall: #(xmpp_stanza_t *xmpp_iq_new(xmpp_ctx_t *ctx, String type, String id))

