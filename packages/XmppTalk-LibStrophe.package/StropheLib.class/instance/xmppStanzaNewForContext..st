xmpp-stanza
xmppStanzaNewForContext: ctx
	^self ffiCall: #(xmpp_stanza_t * xmpp_stanza_new(xmpp_ctx_t * ctx))