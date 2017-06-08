stanza-presence
sendPresenceStanza
	"This version uses ctx and conn from the initial connection. No need to retreive them from the callback parms"
	| presenceStanza |
	presenceStanza := self newPresenceStanza.
	self sendStanza: presenceStanza.
	self releaseStanza: presenceStanza