logging
logStanzaSent: aStanza
	| stanzaInfo |
	stanzaInfo := self rememberStanza: aStanza direction: #sent.
	
	logLevel < 3 ifTrue: [ ^ nil ].
	^ (self newLogEvent: XmppStanzaSentEvent)
		stanzaInfo: stanzaInfo;
		emit