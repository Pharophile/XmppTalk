xmpp-base64-encode
xmppBase64DecodeStr: base64 ofSize: len forContext: ctx
	^self ffiCall: #(String xmpp_base64_decode_str(xmpp_ctx_t *ctx, String base64, size_t len))
