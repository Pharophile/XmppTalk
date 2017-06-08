xmpp-stanza-common-helpers
xmppStanza: stanza setTypeTo: type

	^self ffiCall: #(int xmpp_stanza_set_type(xmpp_stanza_t * stanza, String type))
