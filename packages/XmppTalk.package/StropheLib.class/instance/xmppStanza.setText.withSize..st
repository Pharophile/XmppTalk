xmpp-stanza-details
xmppStanza: stanza setText: text withSize: size
	^self ffiCall: #(int xmpp_stanza_set_text_with_size(xmpp_stanza_t *stanza, String text, size_t size))