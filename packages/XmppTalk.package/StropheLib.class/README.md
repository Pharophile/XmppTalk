Provides a UFFI binding for LibStrophe (XMPP)

For Pharo5, one needs to update the ConfigurationOfUnifiedFFI package and 

(ConfigurationOfUnifiedFFI project version: #stable) load.

typedef void (*xmpp_conn_handler)(xmpp_conn_t * const conn, 
				  const xmpp_conn_event_t event,
				  const int error,
				  xmpp_stream_error_t * const stream_error,
				  void * const userdata);
				
