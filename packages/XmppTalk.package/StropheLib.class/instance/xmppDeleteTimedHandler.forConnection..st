xmpp-handlers
xmppDeleteTimedHandler: handler forConnection: conn
"void xmpp_timed_handler_delete(xmpp_conn_t * const conn,
			       xmpp_timed_handler handler);"
			
	^self ffiCall: #(void xmpp_timed_handler_delete(xmpp_conn_t * conn, xmpp_timed_handler handler))