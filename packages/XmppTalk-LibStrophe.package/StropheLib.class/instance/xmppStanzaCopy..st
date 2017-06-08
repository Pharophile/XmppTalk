xmpp-stanza
xmppStanzaCopy: stanza
	^self ffiCall: #(xmpp_stanza_t *xmpp_stanza_copy(xmpp_stanza_t * stanza))