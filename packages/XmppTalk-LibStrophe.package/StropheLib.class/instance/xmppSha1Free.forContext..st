xmpp-sha1
xmppSha1Free: sha1 forContext: ctx

	^self ffiCall: #(void xmpp_sha1_free(xmpp_sha1_t *sha1))
