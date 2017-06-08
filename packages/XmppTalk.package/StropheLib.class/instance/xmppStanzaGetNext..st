xmpp-stanza-details
xmppStanzaGetNext: stanza
	^self ffiCall: #(xmpp_stanza_t *xmpp_stanza_get_next(xmpp_stanza_t * stanza))