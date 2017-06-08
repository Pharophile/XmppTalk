xmpp-stanza-details
xmppStanza: stanza getAttributes: attr withAttrlen: attrlen
	^self ffiCall: #(int xmpp_stanza_get_attributes(xmpp_stanza_t * stanza, String * attr, int attrlen))