callbacks-xep-handlers
handleDicoInfo: stanzaOpaqueObject
	| identityStanzaOpaqueObject incomingStanzaId replyStanzaOpaqueObject featureMucStanzaOpaqueObject ns from queryStanzaOpaqueObject children featureTimeStanzaOpaqueObject |
	
	from := self getStanzaFromAttribute: stanzaOpaqueObject.
	incomingStanzaId := self getStanzaId: stanzaOpaqueObject.
	replyStanzaOpaqueObject := self newIqResultStanzaWithId: incomingStanzaId.
	lib
		xmppStanza: replyStanzaOpaqueObject
		setAttribute: XmppStanzaAttr ATTR_TO
		toValue: from.
	queryStanzaOpaqueObject := self newStanza.
	lib
		xmppStanza: queryStanzaOpaqueObject
		setName: XmppStanzaName NAME_QUERY.
	children := lib xmppStanzaGetChildren: stanzaOpaqueObject.
	ns := lib xmppStanzaGetNs: children.
	ns = 0
		ifFalse: [ lib xmppStanza: queryStanzaOpaqueObject setNsTo: ns ].
	"? what if we get null?"
	identityStanzaOpaqueObject := self newIdentityStanza.
	lib
		xmppStanza: identityStanzaOpaqueObject
		setAttribute: XmppStanzaAttr ATTR_CATEGORY
		toValue: 'client'.
	lib
		xmppStanza: identityStanzaOpaqueObject
		setAttribute: XmppStanzaAttr ATTR_TYPE
		toValue: 'pc'.
	lib
		xmppStanza: queryStanzaOpaqueObject
		addChild: identityStanzaOpaqueObject.
	featureMucStanzaOpaqueObject := self
		newFeatureStanza: XmppStanzaNS NS_MUC.
	lib
		xmppStanza: queryStanzaOpaqueObject
		addChild: featureMucStanzaOpaqueObject.
	featureTimeStanzaOpaqueObject := self
		newFeatureStanza: XmppStanzaNS NS_TIME.
	lib
		xmppStanza: queryStanzaOpaqueObject
		addChild: featureTimeStanzaOpaqueObject.
	lib
		xmppStanza: replyStanzaOpaqueObject
		addChild: queryStanzaOpaqueObject.
		
	self sendStanza: replyStanzaOpaqueObject.
	{replyStanzaOpaqueObject.
	queryStanzaOpaqueObject.
	featureMucStanzaOpaqueObject.
	featureTimeStanzaOpaqueObject.
	identityStanzaOpaqueObject} do: [ :each | self releaseStanza: each ]