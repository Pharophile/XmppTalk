xmpp-stanza-common-helpers
xmppStanzaGetNs: stanza

	^self ffiCall: #(String xmpp_stanza_get_ns(xmpp_stanza_t * stanza))
