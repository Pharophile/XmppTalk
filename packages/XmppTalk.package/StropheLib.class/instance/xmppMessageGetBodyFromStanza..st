xmpp-stanza-messages
xmppMessageGetBodyFromStanza: msg
	^self ffiCall: #(String xmpp_message_get_body(xmpp_stanza_t *msg))
