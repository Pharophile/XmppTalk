stanza-building
newIqResultStanzaWithId: anId

	| stanzaOpaqueObject |
	stanzaOpaqueObject := self newStanza.

	lib xmppStanza: stanzaOpaqueObject setName: XmppStanzaName NAME_IQ.
	lib xmppStanza: stanzaOpaqueObject setTypeTo: XmppStanzaType TYPE_RESULT.
			
	lib xmppStanza: stanzaOpaqueObject setIdTo: anId.
	^stanzaOpaqueObject

