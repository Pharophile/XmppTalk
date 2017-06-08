xmpp-callbacks
xmppConnHandlerCallbackTemplate

		"raw signature: #(void (*xmpp_conn_handler)(xmpp_conn_t * const conn, xmpp_conn_event_t event, int error,  xmpp_stream_error_t * const stream_error,	  void * const userdata))"
			
		| callback |
	callback := FFICallback 
			signature: #(void (xmpp_conn_t * conn, xmpp_conn_event_t event, int error,  xmpp_stream_error_t * stream_error, String userdata))
			block: [  :conn :event :error :stream_error :userdata |
				{ conn. event. error. stream_error. userdata } inspect
				]
		 