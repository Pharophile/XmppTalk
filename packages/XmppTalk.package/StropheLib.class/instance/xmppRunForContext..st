xmpp-eventloop
xmppRunForContext: ctx

	^ self ffiCall: #(void xmpp_run(xmpp_ctx_t * ctx))
