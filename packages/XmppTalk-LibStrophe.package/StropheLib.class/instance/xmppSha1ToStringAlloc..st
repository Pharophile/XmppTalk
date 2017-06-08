xmpp-sha1
xmppSha1ToStringAlloc: sha1

	^self ffiCall: #(ByteArray xmpp_sha1_to_string_alloc(xmpp_sha1_t *sha1))
"void xmpp_sha1_to_digest(xmpp_sha1_t *sha1, unsigned char *digest);
"