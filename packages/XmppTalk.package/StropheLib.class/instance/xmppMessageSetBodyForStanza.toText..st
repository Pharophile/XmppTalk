xmpp-stanza-messages
xmppMessageSetBodyForStanza: msg toText: text
	^self ffiCall: #(int xmpp_message_set_body(xmpp_stanza_t *msg, String text))