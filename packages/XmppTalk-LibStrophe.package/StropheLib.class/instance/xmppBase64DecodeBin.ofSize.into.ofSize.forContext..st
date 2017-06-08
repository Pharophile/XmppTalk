xmpp-base64-encode
xmppBase64DecodeBin: base64 ofSize: len into: out ofSize: outlen forContext: ctx
	^self ffiCall: #(String xmpp_base64_decode_bin(xmpp_ctx_t *ctx, String base64, size_t len, ByteArray * out, size_t *outlen))