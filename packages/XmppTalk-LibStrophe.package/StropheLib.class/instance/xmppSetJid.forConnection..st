xmpp-jid
xmppSetJid: jid forConnection: conn
	"^self ffiCall: #( void xmpp_conn_set_jid(xmpp_conn_t * const conn, const char * const jid) ) "

	^self ffiCall: #( void xmpp_conn_set_jid(xmpp_conn_t * conn, String jid) ) 
