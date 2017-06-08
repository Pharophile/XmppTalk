callbacks-handlers
"protocol: callbacks-handlers"
messageHandlerCallback

		"int message_handler(xmpp_conn_t * const conn, xmpp_stanza_t * const stanza, void * const userdata)"

	| exit |
	^ FFICallback
		signature: #(int #(void * conn2 , void * stanza, void * userdata))
		block: [ :conn2 :stanza :userdata | 
			| ctxOpaqueObject connOpaqueObject stanzaOpaqueObject |
			
			self logCallbackInvoked: #messageHandler.
			
			ctxOpaqueObject := StropheXmppCtx fromHandle: userdata.	"Weird, but that's it."
			connOpaqueObject := StropheXmppConn fromHandle: conn2.
			stanzaOpaqueObject := StropheXmppConn fromHandle: stanza.
			
			self logStanzaReceived: stanzaOpaqueObject.
	
			exit := self handleMessage: stanzaOpaqueObject.
			exit
        ]