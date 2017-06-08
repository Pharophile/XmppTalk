xmpp-eventloop
xmppStopForContext: ctx

	^ self ffiCall: #(void xmpp_stop(xmpp_ctx_t * ctx))
