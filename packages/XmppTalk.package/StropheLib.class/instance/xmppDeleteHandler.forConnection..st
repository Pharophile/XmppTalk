xmpp-handlers
xmppDeleteHandler: handler forConnection: conn
"void xmpp_handler_delete(xmpp_conn_t * const conn,
			 xmpp_handler handler);"
			
	^self ffiCall: #(void xmpp_handler_delete(xmpp_conn_t * conn, xmpp_handler handler))