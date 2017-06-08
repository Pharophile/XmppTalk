xmpp-stanza-messages
xmppMessageNewOfType: type forContext: ctx to: to withId: id
	^self ffiCall: #(xmpp_stanza_t *xmpp_message_new(xmpp_ctx_t *ctx, String type, String to, String id))
