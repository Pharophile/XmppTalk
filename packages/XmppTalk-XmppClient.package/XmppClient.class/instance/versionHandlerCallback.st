callbacks-handlers
versionHandlerCallback

^ FFICallback
		signature: #(int #(void * conn , void * stanza, void * userdata))
		block: [ :conn2 :stanza :userdata |  
			| ctxOpaqueObject connOpaqueObject stanzaOpaqueObject   from replyStanzaOpaqueObject   queryStanzaOpaqueObject textStanzaOpaqueObject incomingStanzaId ns children nameStanzaOpaqueObject  versionStanzaOpaqueObject |
			
			self logCallbackInvoked: #versionHandler.
			
			ctxOpaqueObject := StropheXmppCtx fromHandle: userdata.	"Weird, but that's it."
			connOpaqueObject := StropheXmppConn fromHandle: conn2.
			stanzaOpaqueObject := StropheXmppConn fromHandle: stanza.
			
			
			self logStanzaReceived: stanzaOpaqueObject.
			
			self
				termOut:
					('{now} -- versionHandlerCallback'
						format:
							{	(#now -> DateAndTime now)} asDictionary).

		from := lib xmppStanza: stanzaOpaqueObject  getAttribute: 'from'.			

		self
				termOut:
					('{now} -- versionHandlerCallback - incoming message from: {from}'
						format:
							{	(#now -> DateAndTime now). #from -> from} asDictionary).


		replyStanzaOpaqueObject  := lib xmppStanzaNewForContext: ctxOpaqueObject.

		lib xmppStanza: replyStanzaOpaqueObject setName: 'iq'.
		lib xmppStanza: replyStanzaOpaqueObject setTypeTo: 'result'.

		incomingStanzaId := lib xmppStanzaGetId: stanzaOpaqueObject.
		lib xmppStanza: replyStanzaOpaqueObject  setIdTo: incomingStanzaId.
		
		lib xmppStanza: replyStanzaOpaqueObject setAttribute: 'to' toValue: from.

		queryStanzaOpaqueObject := lib xmppStanzaNewForContext: ctxOpaqueObject.
		lib xmppStanza: queryStanzaOpaqueObject setName: 'query'.
	
		children	:= lib xmppStanzaGetChildren: stanzaOpaqueObject.
		ns := lib xmppStanzaGetNs: children.
		ns = 0 ifFalse: [ 
			"? what if we get null?"
			lib xmppStanza: queryStanzaOpaqueObject setNsTo: ns.
			 ].
		
		nameStanzaOpaqueObject := lib xmppStanzaNewForContext: ctxOpaqueObject.
		lib xmppStanza: nameStanzaOpaqueObject setName: 'name'.
		lib xmppStanza: queryStanzaOpaqueObject  addChild: nameStanzaOpaqueObject.
		
		textStanzaOpaqueObject := lib xmppStanzaNewForContext: ctxOpaqueObject.
		lib xmppStanza: textStanzaOpaqueObject setName: self defaultConnectionSpec nick.
		lib xmppStanza: nameStanzaOpaqueObject  addChild: textStanzaOpaqueObject.

		versionStanzaOpaqueObject := lib xmppStanzaNewForContext: ctxOpaqueObject.
		lib xmppStanza: versionStanzaOpaqueObject setName: 'version'.
		lib xmppStanza: queryStanzaOpaqueObject  addChild: versionStanzaOpaqueObject.
		
		textStanzaOpaqueObject := lib xmppStanzaNewForContext: ctxOpaqueObject.
		lib xmppStanza: textStanzaOpaqueObject setName: '1.0'.
		lib xmppStanza: versionStanzaOpaqueObject  addChild: textStanzaOpaqueObject.

		lib xmppStanza: replyStanzaOpaqueObject addChild: queryStanzaOpaqueObject.		
				
		
		self
				termOut:
					('{now} -- versionHandlerCallback - sending stanza out'
						format:
							{	(#now -> DateAndTime now)} asDictionary).
								
		self sendStanza: replyStanzaOpaqueObject onConnection:  connOpaqueObject.

		lib xmppStanzaRelease: replyStanzaOpaqueObject.
	

		self
				termOut:
					('{now} -- versionHandlerCallback - done'
						format:
							{	(#now -> DateAndTime now)} asDictionary).
		
		1
		]
        