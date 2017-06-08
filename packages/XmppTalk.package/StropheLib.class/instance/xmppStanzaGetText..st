xmpp-stanza-details
xmppStanzaGetText: stanza
	^self ffiCall: #(String xmpp_stanza_get_text(xmpp_stanza_t * stanza))