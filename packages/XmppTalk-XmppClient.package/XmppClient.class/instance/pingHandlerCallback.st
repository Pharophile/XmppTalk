callbacks-handlers
pingHandlerCallback
	"https://xmpp.org/extensions/xep-0199.html"

	^ FFICallback
		signature: #(#int #(#void #* #conn #, #void #* #stanza #, #void #* #userdata))
		block: [ :conn2 :stanza :userdata | 
			| ctxOpaqueObject connOpaqueObject stanzaOpaqueObject |
			self logCallbackInvoked: #pingHandler.
			ctxOpaqueObject := StropheXmppCtx fromHandle: userdata.	"Weird, but that's it."
			connOpaqueObject := StropheXmppConn fromHandle: conn2.
			stanzaOpaqueObject := StropheXmppConn fromHandle: stanza.
			self logStanzaReceived: stanzaOpaqueObject.
			self handlePing: stanzaOpaqueObject.
			1 ]