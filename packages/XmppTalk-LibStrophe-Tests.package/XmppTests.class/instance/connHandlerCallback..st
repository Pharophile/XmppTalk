callbacks
connHandlerCallback: lib
	
	^ FFICallback
		signature: #(#void #(void * conn , int event , int error , void * stream_error , void * userdata))
		block: [ :conn2 :event :error :stream_error :userdata  | 
			| ctxOpaqueObject connOpaqueObject streamErrorOpaqueObject presenceStanza messageHandlerCallback |
			ctxOpaqueObject := StropheXmppCtx fromHandle: userdata.	"Weird, but that's it."
			connOpaqueObject := StropheXmppConn fromHandle: conn2.
			streamErrorOpaqueObject := StropheXmppStreamError fromHandle: stream_error.
			self
				termOut:
					('{now} -- Callback - event: {event}'
						format:
							{(#event -> event).
							(#now -> DateAndTime now)} asDictionary).
			({XMPP_CONN_CONNECT.
			XMPP_CONN_RAW_CONNECT.
			XMPP_CONN_DISCONNECT.
			XMPP_CONN_FAIL} anySatisfy: [ :each | each = event ])
				ifTrue: [ XMPP_CONN_CONNECT = event
						ifTrue: [ | secured |
							self termOut: 'XMPP_CONN_CONNECT handler'.
							secured := lib xmppIsSecureConnection: connOpaqueObject.
							secured = 0
								ifTrue: [ self termOut: 'Unsecured Connection' ]
								ifFalse: [ self termOut: 'Secured Connection' ].
								
    					    "lib 
								xmppAddHandler: (self versionHandlerCallback:lib) 
								forNs: 'jabber:iq:version' 
								forName: 'iq' 
								forType: nil
								withUserData: ctxOpaqueObject  
								forConnection: connOpaqueObject."
								
							messageHandlerCallback := self messageHandlerCallback: lib.
							messageHandlerCallback pin. 
							self flag: #TODO. "Make sure this gets unpin when done"
							"This one is giving trouble with cannot coerce arguments --> Was because of getHandle"
							
							lib
								xmppAddHandler: messageHandlerCallback
								forNs:  nil
								forName: 'message' 
								forType: nil "'normal'"
								withUserData: ctxOpaqueObject getHandle  "damned getHandle"
								forConnection: connOpaqueObject.
							
								
							"Let's see what this gives"
							"lib 	xmppAddHandler: messageHandlerCallback forId: 'placeholder' withUserData: ctxOpaqueObject getHandle forConnection: connOpaqueObject."
							
							"Send initial <presence/> so that we appear online to contacts"
							presenceStanza := lib xmppPresenceNewForContext: ctxOpaqueObject.
							lib xmppSendStanza: presenceStanza onConnection: connOpaqueObject.
							lib xmppStanzaRelease: presenceStanza.
						"	self halt."

								
							"lib xmppDisconnectForConnection: connOpaqueObject" ].
					XMPP_CONN_RAW_CONNECT = event
						ifTrue: [ 
							self termOut: 'XMPP_CONN_RAWCONNECT handler'.

							
							].
					XMPP_CONN_DISCONNECT = event
						ifTrue: [ self termOut: 'XMPP_CONN_DISCONNECT handler' ].
					XMPP_CONN_FAIL = event
						ifTrue: [ self termOut: 'XMPP_CONN_FAIL handler' ] ]
				ifFalse: [ self termOut: 'Undexpected CONN event handler' ] ]