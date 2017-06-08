connection open/close
configureConnection
	logLevel := 10.

	self class resetInterrupt.
	self resetHistory.

	lib := StropheLib uniqueInstance.
	lib xmppInitialize.
	(lib xmppVersionCheckMajor: 0 minor: 0) = 1 ifFalse: [ Error signal: 'Cannot retrieve version' ].
	log := lib xmppGetDefaultLoggerForLevel: XMPP_LEVEL_DEBUG.
	ctx := lib xmppContextNewMemNullWithLog: log.
	conn := lib xmppConnectionNew: ctx.

	lib xmppConnectionSetFlags: connSpec flags forConnection: conn.
	lib xmppSetKeepaliveToTimeout: 10 andInterval: 1 forConnection: conn.
	lib xmppSetJid: connSpec jid forConnection: conn.
	lib xmppSetPass: connSpec pass forConnection: conn.
	
	self registerCallbacks.
	
	lib
		xmppConnectClientForAltdomain: connSpec host
		onAltPort: 0
		withCallback: (self callbackNamed: #connHandler)
		andUserData: ctx getHandle
		forConnection: conn