connection open/close
releaseConnection
	lib xmppDisconnectForConnection: conn.
	self termOut: 'Disconnected'.
	lib xmppStopForContext: ctx.
	self termOut: 'Stop for context done'.
	lib xmppConnectionRelease: conn.
	self termOut: 'Connection released'.
	lib xmppContextFree: ctx.
	self termOut: 'Context Freed'.
	lib xmppShutdown.
	
	self termOut: 'Shutdown done'