xmpp-stanza-details
xmppStanzaGetTextPtr: stanza
	^self ffiCall: #(String xmpp_stanza_get_text_ptr(xmpp_stanza_t * stanza))