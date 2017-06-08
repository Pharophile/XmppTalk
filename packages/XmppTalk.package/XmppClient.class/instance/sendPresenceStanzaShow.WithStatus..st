stanza-presence
sendPresenceStanzaShow: aShowState WithStatus: aStatus
	"This version uses ctx and conn from the initial connection. No need to retreive them from the callback parms"
	"aStatus : unavailable"
	| presenceStanza |
	presenceStanza := lib xmppPresenceNewForContext: self ctx.
	lib xmppStanza: presenceStanza setAttribute: XmppStanzaAttr ATTR_TYPE toValue: aStatus.
	self halt.
	self logStanzaSent: presenceStanza.
	lib xmppSendStanza: presenceStanza onConnection: self conn.
	lib xmppStanzaRelease: presenceStanza