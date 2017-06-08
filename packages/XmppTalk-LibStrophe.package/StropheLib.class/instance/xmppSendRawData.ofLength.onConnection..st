xmpp-send
xmppSendRawData: data ofLength: len onConnection: conn

	"^self ffiCall: #(void xmpp_send_raw(xmpp_conn_t * const conn, const char * const data, const size_t len))"
	^self ffiCall: #(void xmpp_send_raw(xmpp_conn_t * conn, String data, size_t len))