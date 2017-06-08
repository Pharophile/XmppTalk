xmpp-sha1
xmppSha1Final: sha1

	^self ffiCall: #(void xmpp_sha1_final(xmpp_sha1_t *sha1))
	
"char *xmpp_sha1_to_string(xmpp_sha1_t *sha1, char *s, size_t slen);
char *xmpp_sha1_to_string_alloc(xmpp_sha1_t *sha1);
void xmpp_sha1_to_digest(xmpp_sha1_t *sha1, unsigned char *digest);
"