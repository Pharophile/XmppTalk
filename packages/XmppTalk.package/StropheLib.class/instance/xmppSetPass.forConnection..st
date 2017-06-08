xmpp-pass
xmppSetPass: pass forConnection: conn
	"^self ffiCall: #( void xmpp_conn_set_pass(xmpp_conn_t * const conn, const char * const pass) )"
	^self ffiCall: #( void xmpp_conn_set_pass(xmpp_conn_t * conn, String pass) )
	

