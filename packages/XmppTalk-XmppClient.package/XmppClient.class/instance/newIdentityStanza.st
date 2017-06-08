stanza-building
newIdentityStanza
	| stanzaOpaqueObject |
	stanzaOpaqueObject := self newStanza.
	lib xmppStanza: stanzaOpaqueObject setName: XmppStanzaName NAME_IDENTITY.
	^stanzaOpaqueObject