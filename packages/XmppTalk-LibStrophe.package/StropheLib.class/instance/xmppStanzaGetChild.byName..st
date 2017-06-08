xmpp-stanza-details
xmppStanzaGetChild: stanza byName: name
	^self ffiCall: #(xmpp_stanza_t *xmpp_stanza_get_child_by_name(xmpp_stanza_t * stanza, String name))