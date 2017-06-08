xmpp-jid
xmppJidNewForContext: ctx onNode: node forDomain: domain usingResource: resource
	"these return new strings that must be xmpp_free()'d "
	^self ffiCall: #(String xmpp_jid_new(xmpp_ctx_t * ctx, String node, String domain, String *resource))
