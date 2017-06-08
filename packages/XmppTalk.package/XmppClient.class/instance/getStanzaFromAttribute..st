stanza-building
getStanzaFromAttribute: aStanzaOpaqueObject
	^lib xmppStanza: aStanzaOpaqueObject getAttribute: XmppStanzaAttr ATTR_FROM.