xmpp-stanza-details
xmppStanza: stanza addChild: child
	^self ffiCall: #(int xmpp_stanza_add_child(xmpp_stanza_t *stanza, xmpp_stanza_t * child))