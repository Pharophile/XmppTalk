logging
rememberStanza: aStanza direction: aSymbol

	| stanzaString stanzaId stanzaType stanzaInfo |
	stanzaString := self stringFromStanza: aStanza.
	stanzaId := lib xmppStanzaGetId: aStanza.
	stanzaType := lib xmppStanzaGetType: aStanza.
	
	self history rememberStanza: (stanzaInfo :=  { #stanzaId -> stanzaId. #direction -> aSymbol. #stanzaType -> stanzaType. #stanzaString -> stanzaString} asDictionary).
	
	^ stanzaInfo
	

