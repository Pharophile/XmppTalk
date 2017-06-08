stanza-sending
sendStanza: stanzaOpaqueObject onConnection: connOpaqueObject
	
	self logStanzaSent: stanzaOpaqueObject.
	lib	xmppSendStanza: stanzaOpaqueObject	onConnection: connOpaqueObject