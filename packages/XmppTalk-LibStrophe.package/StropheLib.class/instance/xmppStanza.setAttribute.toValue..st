xmpp-stanza-details
xmppStanza: stanza setAttribute: key toValue: value
	^self ffiCall: #(int xmpp_stanza_set_attribute(xmpp_stanza_t * stanza, String key, String value))