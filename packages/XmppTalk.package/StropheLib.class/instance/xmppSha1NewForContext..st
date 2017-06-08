xmpp-sha1
xmppSha1NewForContext: ctx

	^self ffiCall: #(xmpp_sha1_t *xmpp_sha1_new(xmpp_ctx_t *ctx))
