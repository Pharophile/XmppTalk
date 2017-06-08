tests
testXmppBasicConnect
	| lib log ctx conn connSpec connHandler period interval times count |
	
	self class resetInterrupt.
	lib := StropheLib uniqueInstance.
	lib xmppInitialize.
	self assert: (lib xmppVersionCheckMajor: 0 minor: 0) equals: 1.
	log := lib xmppGetDefaultLoggerForLevel: XMPP_LEVEL_DEBUG.
	ctx := lib xmppContextNewMemNullWithLog: log.
	conn := lib xmppConnectionNew: ctx.
	connSpec := self defaultConnectionSpec.
	lib xmppConnectionSetFlags: connSpec flags forConnection: conn.
	lib xmppSetKeepaliveToTimeout: 10 andInterval: 1 forConnection: conn.
	lib xmppSetJid: connSpec jid forConnection: conn.
	lib xmppSetPass: connSpec pass forConnection: conn.

	connHandler := self connHandlerCallback: lib.	
	connHandler pin.

	lib
		xmppConnectClientForAltdomain: connSpec host
		onAltPort: 0
		withCallback: connHandler
		andUserData: ctx getHandle
		forConnection: conn.
	"run is too much for a test"
	period := 90 seconds.
	interval := 200 milliSeconds.
	times := period asMilliSeconds / interval asMilliSeconds.
	self
		termOut:
			('Repeating for {times} with interval of {interval} for a period of {period}'
				format:
					{(#times -> times).
					(#period -> period).
					(#interval -> interval)} asDictionary).

	count := 1.
	[(count <= times) and: [ self class isInterrupted not ] ]
		whileTrue: 
			[
		self termOut: 'About to run once'.
			lib xmppRunOnceWithTimeOut: 1000 forContext: ctx.
			World doOneCycle.
			self termOut: 'Waiting'.
			interval asDelay wait.
			self class isInterrupted ifTrue: [ ].
			self flag: #WAIT.
			count := count + 1].
	self termOut: 'Leaving loop'.

	"lib xmppRunForContext: ctx."
	
	lib xmppDisconnectForConnection: conn.
	self termOut: 'Disconnected'.
	lib xmppStopForContext: ctx.
	self termOut: 'Stop for context done'.
	lib xmppConnectionRelease: conn.
	self termOut: 'Connection released'.
	lib xmppContextFree: ctx.
	self termOut: 'Context Freed'.
	lib xmppShutdown.
	
	connHandler unpin.
	connSpec unpin.
	self termOut: 'Shutdown done'