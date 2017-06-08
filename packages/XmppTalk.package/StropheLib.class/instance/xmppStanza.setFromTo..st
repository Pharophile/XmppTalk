xmpp-stanza-common-helpers
xmppStanza: stanza setFromTo: type

	^self ffiCall: #(int xmpp_stanza_set_to(xmpp_stanza_t * stanza, String from))
