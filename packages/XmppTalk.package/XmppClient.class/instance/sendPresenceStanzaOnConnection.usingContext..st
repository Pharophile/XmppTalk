stanza-presence
sendPresenceStanzaOnConnection: connOpaqueObject usingContext: ctxOpaqueObject
	| presenceStanza |
	presenceStanza := lib xmppPresenceNewForContext: ctxOpaqueObject.
	self logStanzaSent: presenceStanza.
	lib xmppSendStanza: presenceStanza onConnection: connOpaqueObject.
	lib xmppStanzaRelease: presenceStanza