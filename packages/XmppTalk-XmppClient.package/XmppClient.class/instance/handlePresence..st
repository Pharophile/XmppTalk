callbacks-xep-handlers
handlePresence: stanzaOpaqueObject
	| incomingStanzaId from replyStanzaOpaqueObject to |
	from := self getStanzaFromAttribute: stanzaOpaqueObject.
	incomingStanzaId := self getStanzaId: stanzaOpaqueObject.
	to := self getStanzaToAttribute: stanzaOpaqueObject.
	
	replyStanzaOpaqueObject := self newPresenceStanza.
	lib
		xmppStanza: replyStanzaOpaqueObject
		setAttribute: XmppStanzaAttr ATTR_TO
		toValue: from.
		
	lib
		xmppStanza: replyStanzaOpaqueObject
		setAttribute: XmppStanzaAttr ATTR_FROM
		toValue: to.

	lib
		xmppStanza: replyStanzaOpaqueObject
		setAttribute: XmppStanzaAttr ATTR_TYPE
		toValue: XmppStanzaType TYPE_SUBSCRIBED.
		
	self sendStanza: replyStanzaOpaqueObject.
	self releaseStanza: replyStanzaOpaqueObject