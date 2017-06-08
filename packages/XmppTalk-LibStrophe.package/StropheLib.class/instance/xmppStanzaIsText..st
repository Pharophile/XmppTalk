xmpp-stanza
xmppStanzaIsText: stanza
	^self ffiCall: #(int xmpp_stanza_is_text(xmpp_stanza_t * stanza))