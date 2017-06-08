xmpp-stanza-common-helpers
xmppStanzaReply: stanza

	^self ffiCall: #(xmpp_stanza_t *xmpp_stanza_reply(xmpp_stanza_t * stanza))
