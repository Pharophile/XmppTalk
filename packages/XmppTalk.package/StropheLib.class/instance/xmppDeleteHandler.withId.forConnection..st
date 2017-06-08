xmpp-handlers
xmppDeleteHandler: handler withId: id forConnection: conn
	"void xmpp_id_handler_delete(xmpp_conn_t * const conn,
			    xmpp_handler handler,
			    const char * const id);"
	^self ffiCall: #(	void xmpp_id_handler_delete(xmpp_conn_t * conn, xmpp_handler handler, String id))