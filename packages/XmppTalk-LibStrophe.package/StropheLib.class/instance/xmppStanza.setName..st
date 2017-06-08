xmpp-stanza-details
xmppStanza: stanza setName: name
	^self ffiCall: #(int xmpp_stanza_set_name(xmpp_stanza_t *stanza, String name))