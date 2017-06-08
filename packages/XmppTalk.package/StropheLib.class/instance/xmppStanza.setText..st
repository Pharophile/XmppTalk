xmpp-stanza-details
xmppStanza: stanza setText: text
	^self ffiCall: #(int xmpp_stanza_set_text(xmpp_stanza_t *stanza, String text))