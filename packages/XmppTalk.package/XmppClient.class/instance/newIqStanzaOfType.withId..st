stanza-building
newIqStanzaOfType: aStanzaType withId: anId

	| stanzaOpaqueObject |
	stanzaOpaqueObject := self newStanza.

	lib xmppStanza: stanzaOpaqueObject setName: XmppStanzaName NAME_IQ.
	lib xmppStanza: stanzaOpaqueObject setTypeTo: aStanzaType.
			
	lib xmppStanza: stanzaOpaqueObject setIdTo: anId.
	^stanzaOpaqueObject

