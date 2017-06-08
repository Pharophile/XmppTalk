xmpp-stanza-common-helpers
xmppStanzaGetTo: stanza

	^self ffiCall: #(String xmpp_stanza_get_to(xmpp_stanza_t * stanza))
