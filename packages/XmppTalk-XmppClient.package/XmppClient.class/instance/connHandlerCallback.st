callbacks-handlers
connHandlerCallback
	"The conn handler callback hooks other callbacks, so we have to be careful that these are not GC'd under our feet"

	^ FFICallback
		signature:
			#(#void #(#void #* #conn #, #int #event #, #int #error #, #void #* #stream_error #, #void #* #userdata))
		block: [ :conn2 :event :error :stream_error :userdata | 
			| ctxOpaqueObject connOpaqueObject streamErrorOpaqueObject |
			self logCallbackInvoked: #connHandler.
			ctxOpaqueObject := StropheXmppCtx fromHandle: userdata.	"Weird, but that's it."
			connOpaqueObject := StropheXmppConn fromHandle: conn2.
			streamErrorOpaqueObject := StropheXmppStreamError	fromHandle: stream_error.
			
			({XMPP_CONN_CONNECT.
			XMPP_CONN_RAW_CONNECT.
			XMPP_CONN_DISCONNECT.
			XMPP_CONN_FAIL} anySatisfy: [ :each | each = event ])
				ifTrue: [ XMPP_CONN_CONNECT = event
						ifTrue: [ | secured |
							"	self halt."
							"'normal'"
							"damned getHandle"
							"Let's see what this gives"
							"lib 	xmppAddHandler: messageHandlerCallback forId: 'placeholder' withUserData: ctxOpaqueObject getHandle forConnection: connOpaqueObject."
							"Send initial <presence/> so that we appear online to contacts"
							secured := lib xmppIsSecureConnection: connOpaqueObject.
							secured = 0
								ifTrue: [ self logClientConnectSecurely: false ]
								ifFalse: [ self logClientConnectSecurely: true ].
							self
								registerHandlersForConnection: connOpaqueObject
								usingContext: ctxOpaqueObject.

							self sendPresenceStanza.
								
							self beConnected ].
					XMPP_CONN_RAW_CONNECT = event
						ifTrue: [ self logClientRawConnect ].
					XMPP_CONN_DISCONNECT = event
						ifTrue: [ self logClientDisconnect.
							self beDisconnected.
							self flag: #TODO.
							self class interrupt

							"lib xmppDisconnectForConnection: connOpaqueObject" ].
					XMPP_CONN_FAIL = event
						ifTrue: [ self logClientFail.
							self beDisconnected ] ]
				ifFalse: [ self logClientUnexpectedConnect.
					self halt ] ]