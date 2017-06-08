xmpp-sha1
xmppSha1: sha1 toDigest: digest

	^self ffiCall: #(void xmpp_sha1_to_digest(xmpp_sha1_t *sha1, ByteArray digest))
