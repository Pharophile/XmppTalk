callbacks-handlers
discoInfoHandlerCallback
	^ FFICallback
		signature: #(#int #(#void #* #conn #, #void #* #stanza #, #void #* #userdata))
		block: [ :conn2 :stanza :userdata | 
			| ctxOpaqueObject connOpaqueObject stanzaOpaqueObject |
			"? what if we get null?"
			self logCallbackInvoked: #discoInfoHandler.
			ctxOpaqueObject := StropheXmppCtx fromHandle: userdata.	"Weird, but that's it."
			connOpaqueObject := StropheXmppConn fromHandle: conn2.
			stanzaOpaqueObject := StropheXmppConn fromHandle: stanza.
			self logStanzaReceived: stanzaOpaqueObject.
			self handleDicoInfo: stanzaOpaqueObject.
			1 ]