xmpp-stanza-common-helpers
xmppStanzaGetType: stanza

	^self ffiCall: #(String xmpp_stanza_get_type(xmpp_stanza_t * stanza))

