xmpp-base64-encode
xmppBase64Encode: data ofSize: size forContext: ctx
	^self ffiCall: #(String xmpp_base64_encode(xmpp_ctx_t *ctx, ByteArray data, size_t size))
