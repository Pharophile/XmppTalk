callbacks-xep-handlers
handleMessage: stanzaOpaqueObject
	| replytext bodyChild bodyStanzaOpaqueObject actualReplyStanzaType intext errorStanza from textStanzaOpaqueObject replyStanzaOpaqueObject incomingStanzaType |
	(bodyChild := lib
		xmppStanzaGetChild: stanzaOpaqueObject
		byName: XmppStanzaName NAME_BODY) = 0
		ifTrue: [ ^ 1 ].
	(errorStanza := lib
		xmppStanza: stanzaOpaqueObject
		getAttribute: XmppStanzaAttr ATTR_TYPE) = 'error'
		ifTrue: [  ^ 1 ].
	intext := lib xmppStanzaGetText: bodyChild.
	from := self getStanzaFromAttribute: stanzaOpaqueObject.
	replyStanzaOpaqueObject := self newStanza.
	lib
		xmppStanza: replyStanzaOpaqueObject
		setName: XmppStanzaName NAME_MESSAGE.
	incomingStanzaType := lib xmppStanzaGetType: stanzaOpaqueObject.
	actualReplyStanzaType := incomingStanzaType = 0
		ifTrue: [ XmppStanzaType TYPE_CHAT ]
		ifFalse: [ incomingStanzaType ].
	lib
		xmppStanza: replyStanzaOpaqueObject
		setTypeTo: actualReplyStanzaType.
	lib
		xmppStanza: replyStanzaOpaqueObject
		setAttribute: XmppStanzaAttr ATTR_TO
		toValue: from.
	bodyStanzaOpaqueObject := self newStanza.
	lib
		xmppStanza: bodyStanzaOpaqueObject
		setName: XmppStanzaName NAME_BODY.
	replytext := intext , ' to you too!'.
	textStanzaOpaqueObject := self newStanza.
	lib xmppStanza: textStanzaOpaqueObject setText: replytext.
	lib
		xmppStanza: bodyStanzaOpaqueObject
		addChild: textStanzaOpaqueObject.
	lib
		xmppStanza: replyStanzaOpaqueObject
		addChild: bodyStanzaOpaqueObject.
	self
		sendStanza: replyStanzaOpaqueObject.
		
	self releaseStanza: replyStanzaOpaqueObject.
	^1
	