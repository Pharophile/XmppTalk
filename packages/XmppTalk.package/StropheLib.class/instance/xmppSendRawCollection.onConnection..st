xmpp-send
xmppSendRawCollection: collection onConnection: conn
	self flag: #TODO. "How to do this??"
	"^self ffiCall: #(void xmpp_send_raw_string(xmpp_conn_t * const conn, const char * const fmt, ...))"
	^self ffiCall: #(void xmpp_send_raw_string(xmpp_conn_t *  conn, String fmt, ...))
