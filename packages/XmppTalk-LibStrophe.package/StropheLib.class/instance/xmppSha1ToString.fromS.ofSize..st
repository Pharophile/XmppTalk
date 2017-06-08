xmpp-sha1
xmppSha1ToString: sha1 fromS: s ofSize: len

	^self ffiCall: #(String xmpp_sha1_to_string(xmpp_sha1_t * sha1, ByteArray s, size_t len))
"char *xmpp_sha1_to_string_alloc(xmpp_sha1_t *sha1);
void xmpp_sha1_to_digest(xmpp_sha1_t *sha1, unsigned char *digest);
"