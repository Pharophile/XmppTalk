xmpp-connection
xmppSetKeepaliveToTimeout: timeout andInterval: interval forConnection: conn
	^self ffiCall: #(void xmpp_conn_set_keepalive(xmpp_conn_t * conn, int timeout, int interval))

