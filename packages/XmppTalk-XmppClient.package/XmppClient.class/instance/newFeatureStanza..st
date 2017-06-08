stanza-building
newFeatureStanza: aFeatureNS
	| stanzaOpaqueObject |
	stanzaOpaqueObject := self newStanza.
	lib xmppStanza: stanzaOpaqueObject setName: XmppStanzaName NAME_FEATURE.
	lib	xmppStanza: stanzaOpaqueObject setAttribute: XmppStanzaAttr ATTR_VAR toValue: aFeatureNS.
	^stanzaOpaqueObject