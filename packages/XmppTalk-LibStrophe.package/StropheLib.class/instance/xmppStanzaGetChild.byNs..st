xmpp-stanza-details
xmppStanzaGetChild: stanza byNs: ns
	^self ffiCall: #(xmpp_stanza_t *xmpp_stanza_get_child_by_ns(xmpp_stanza_t * stanza, String ns))