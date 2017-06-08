xmpp-stanza-details
xmppStanzaGetName: stanza
	^self ffiCall: #(String xmpp_stanza_get_name(xmpp_stanza_t * stanza))