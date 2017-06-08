xmpp-stanza-details
xmppStanza: stanza getAttribute: name
	^self ffiCall: #(String xmpp_stanza_get_attribute(xmpp_stanza_t * stanza,	String name))