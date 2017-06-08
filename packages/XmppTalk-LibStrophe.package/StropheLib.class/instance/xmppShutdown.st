xmpp-initialize
xmppShutdown
	"Shutdown the Strophe library."
	^self ffiCall: #(void xmpp_shutdown(void) )
