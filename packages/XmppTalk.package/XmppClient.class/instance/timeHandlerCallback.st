callbacks-handlers
timeHandlerCallback
"https://xmpp.org/extensions/xep-0199.html"


^ FFICallback
		signature: #(int #(void * conn , void * stanza, void * userdata))
		block: [ :conn2 :stanza :userdata | 
			| ctxOpaqueObject connOpaqueObject stanzaOpaqueObject   from replyStanzaOpaqueObject     incomingStanzaId timeStanzaOpaqueObject timezoneStanzaOpaqueObject utcStanzaOpaqueObject textStanzaOpaqueObject|
			
			
			self logCallbackInvoked: #timeHandler.
			
			ctxOpaqueObject := StropheXmppCtx fromHandle: userdata.	"Weird, but that's it."
			connOpaqueObject := StropheXmppConn fromHandle: conn2.
			stanzaOpaqueObject := StropheXmppConn fromHandle: stanza.
			
			self logStanzaReceived: stanzaOpaqueObject.

		from := self getStanzaFromAttribute: stanzaOpaqueObject.

		incomingStanzaId := lib xmppStanzaGetId: stanzaOpaqueObject.

		replyStanzaOpaqueObject  := self newIqResultStanzaWithId: incomingStanzaId.
		lib xmppStanza: replyStanzaOpaqueObject setAttribute: XmppStanzaAttr ATTR_TO toValue: from.
		
		"Add time info"
		timeStanzaOpaqueObject := lib xmppStanzaNewForContext: ctxOpaqueObject.
		lib xmppStanza: timeStanzaOpaqueObject setName: 'time'.
		lib xmppStanza: timeStanzaOpaqueObject setNsTo: 'urn:xmpp:time'.
		
		
		timezoneStanzaOpaqueObject := lib xmppStanzaNewForContext: ctxOpaqueObject.
		lib xmppStanza: timezoneStanzaOpaqueObject setName: 'tzo'.
		textStanzaOpaqueObject := lib xmppStanzaNewForContext: ctxOpaqueObject.
		lib xmppStanza: textStanzaOpaqueObject setText:  '+02:00'.
		lib xmppStanza: timezoneStanzaOpaqueObject  addChild: textStanzaOpaqueObject.
		lib xmppStanza: timeStanzaOpaqueObject  addChild: timezoneStanzaOpaqueObject.
		
		utcStanzaOpaqueObject := lib xmppStanzaNewForContext: ctxOpaqueObject.
		lib xmppStanza: utcStanzaOpaqueObject setName: 'utc'.

		textStanzaOpaqueObject := lib xmppStanzaNewForContext: ctxOpaqueObject.
		lib xmppStanza: textStanzaOpaqueObject setText: (DateAndTime now asString first:19).
		lib xmppStanza: utcStanzaOpaqueObject  addChild: textStanzaOpaqueObject.

		lib xmppStanza: timeStanzaOpaqueObject  addChild: utcStanzaOpaqueObject.
		
		lib xmppStanza: replyStanzaOpaqueObject  addChild: timeStanzaOpaqueObject.


		"<time xmlns='urn:xmpp:time'>
		    <tzo>-06:00</tzo>
  		    <utc>2006-12-19T17:58:35Z</utc>
		  </time>"
		
								
		self sendStanza: replyStanzaOpaqueObject onConnection:  connOpaqueObject.

		lib xmppStanzaRelease: replyStanzaOpaqueObject.
	

		self
				termOut:
					('{now} -- timeHandlerCallback - done'
						format:
							{	(#now -> DateAndTime now)} asDictionary).
		1
        ]