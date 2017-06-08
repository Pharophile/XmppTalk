callbacks-xep-handlers
handlePing: stanzaOpaqueObject
	| incomingStanzaId from replyStanzaOpaqueObject |
	from := self getStanzaFromAttribute: stanzaOpaqueObject.
	self halt.
	incomingStanzaId := self getStanzaId: stanzaOpaqueObject.
	replyStanzaOpaqueObject := self
		newIqResultStanzaWithId: incomingStanzaId.
	lib
		xmppStanza: replyStanzaOpaqueObject
		setAttribute: XmppStanzaAttr ATTR_TO
		toValue: from.
	self sendStanza: replyStanzaOpaqueObject.
	lib xmppStanzaRelease: replyStanzaOpaqueObject