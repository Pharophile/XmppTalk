xmpp-sha1
xmppSha1Data: data ofSize: len forContext: ctx

	^ self ffiCall: #(String xmpp_sha1(xmpp_ctx_t *ctx, ByteArray data, size_t len))
