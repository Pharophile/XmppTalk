xmpp-eventloop
xmppRunOnceWithTimeOut: timeout forContext: ctx

	^ self ffiCall: #(void xmpp_run_once(xmpp_ctx_t *ctx, ulong  timeout))
