xmpp-jid
xmppJidResourceForContext: ctx withJid: jid
	"these return new strings that must be xmpp_free()'d "
	^self ffiCall: #(String  xmpp_jid_resource(xmpp_ctx_t *ctx, String jid))
