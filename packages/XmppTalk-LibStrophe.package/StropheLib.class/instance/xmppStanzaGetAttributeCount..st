xmpp-stanza-details
xmppStanzaGetAttributeCount: stanza
	^self ffiCall: #(int xmpp_stanza_get_attribute_count(xmpp_stanza_t * stanza))