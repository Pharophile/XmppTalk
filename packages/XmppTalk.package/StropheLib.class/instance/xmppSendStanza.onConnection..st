xmpp-send
xmppSendStanza: stanza onConnection: conn
	^self ffiCall: #(void xmpp_send(xmpp_conn_t * conn, xmpp_stanza_t * stanza))
