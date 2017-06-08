xmpp-stanza
xmppStanzaClone: stanza
	^self ffiCall: #(xmpp_stanza_t *xmpp_stanza_clone(xmpp_stanza_t * stanza))