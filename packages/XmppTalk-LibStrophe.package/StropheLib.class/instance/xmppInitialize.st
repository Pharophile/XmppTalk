xmpp-initialize
xmppInitialize
	"Initialize the Strophe library."
	^self ffiCall: #(void xmpp_initialize(void) )
