xmpp-stanza-common-helpers
xmppStanzaGetId: stanza

	^self ffiCall: #(String xmpp_stanza_get_id(xmpp_stanza_t * stanza))

