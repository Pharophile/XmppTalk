xmpp-connection
xmppOpenStreamWithAttributes: attributes ofLength: len forConnection: conn
	"^self ffiCall: #(int xmpp_conn_open_stream(xmpp_conn_t * const conn, char **attributes,
	                          size_t attributes_len))"
	
	^self ffiCall: #(int xmpp_conn_open_stream(xmpp_conn_t * const conn, String * attributes, size_t attributes_len))
