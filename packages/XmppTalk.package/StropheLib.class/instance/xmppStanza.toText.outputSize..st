xmpp-stanza
xmppStanza: stanza toText: buf outputSize: buflen
"char * * buf, size_t * buflen"
	^self ffiCall: #(int xmpp_stanza_to_text(xmpp_stanza_t *stanza,  char * * buf, int * buflen)) 