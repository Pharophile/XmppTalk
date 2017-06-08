xmpp-stanza
xmppStanzaIsTag: stanza
	^self ffiCall: #(int xmpp_stanza_is_tag(xmpp_stanza_t * stanza))