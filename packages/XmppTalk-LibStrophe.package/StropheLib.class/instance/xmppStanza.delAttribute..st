xmpp-stanza-details
xmppStanza: stanza delAttribute: name
	^self ffiCall: #(int xmpp_stanza_del_attribute(xmpp_stanza_t * stanza,	String name))