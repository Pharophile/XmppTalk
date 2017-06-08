xmpp-stanza-details
xmppStanzaGetChildren: stanza
	^self ffiCall: #(xmpp_stanza_t * xmpp_stanza_get_children(xmpp_stanza_t * stanza))