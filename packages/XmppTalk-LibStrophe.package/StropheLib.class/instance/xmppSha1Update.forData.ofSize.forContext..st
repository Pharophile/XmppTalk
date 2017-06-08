xmpp-sha1
xmppSha1Update: sha1 forData: data ofSize: len forContext: ctx

	^self ffiCall: #(void xmpp_sha1_update(xmpp_sha1_t *sha1, ByteArray data, size_t len))
