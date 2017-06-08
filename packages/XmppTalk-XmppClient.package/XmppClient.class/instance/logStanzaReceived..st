logging
logStanzaReceived: aStanza

	
	| stanzaInfo |
	stanzaInfo := self rememberStanza: aStanza direction: #received.
	
	logLevel < 3 ifTrue: [ ^ nil ].
	^ (self newLogEvent: XmppStanzaReceivedEvent)
		stanzaInfo: stanzaInfo;
		emit