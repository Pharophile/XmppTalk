xmpp-handlers
doc
'/* if the handle returns false it is removed */
typedef int (*xmpp_timed_handler)(xmpp_conn_t * const conn, 
				  void * const userdata);

void xmpp_timed_handler_add(xmpp_conn_t * const conn,
			    xmpp_timed_handler handler,
			    const unsigned long period,
			    void * const userdata);
void xmpp_timed_handler_delete(xmpp_conn_t * const conn,
			       xmpp_timed_handler handler);


/* if the handler returns false it is removed */
typedef int (*xmpp_handler)(xmpp_conn_t * const conn,
			     xmpp_stanza_t * const stanza,
			     void * const userdata);x
xmpp
void xmpp_handler_add(xmpp_conn_t * const conn,
		      xmpp_handler handler,
		      const char * const ns,
		      const char * const name,
		      const char * const type,
		      void * const userdata);
void xmpp_handler_delete(xmpp_conn_t * const conn,
			 xmpp_handler handler);

void xmpp_id_handler_add(xmpp_conn_t * const conn,
			 xmpp_handler handler,
			 const char * const id,
			 void * const userdata);
void xmpp_id_handler_delete(xmpp_conn_t * const conn,
			    xmpp_handler handler,
			    const char * const id);'