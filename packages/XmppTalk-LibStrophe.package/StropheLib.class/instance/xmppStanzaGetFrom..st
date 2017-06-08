xmpp-stanza-common-helpers
xmppStanzaGetFrom: stanza

	^self ffiCall: #(String xmpp_stanza_get_from(xmpp_stanza_t * stanza))
