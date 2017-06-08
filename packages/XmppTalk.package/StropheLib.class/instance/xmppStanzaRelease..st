xmpp-stanza
xmppStanzaRelease: stanza
	^self ffiCall: #(int xmpp_stanza_release(xmpp_stanza_t * stanza))