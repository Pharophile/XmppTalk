tasks
startXmppBackgroundLoop
	| period interval times count timeout |
	
	[
	self configureConnection.
	
	"run is too much for a test"
	period := 90 seconds.
	interval := 200 milliSeconds.
	timeout := 1000. "milliseconds but FFI thing"

	self logEventLoopStartedForPeriodOf: ( period := 90 seconds ) withInterval: ( interval := 200 milliSeconds ). 
	count := 1.
	times := period asMilliSeconds / interval asMilliSeconds.
	[(count <= times) and: [ self class isInterrupted not ] ]
		whileTrue: 	[
			lib xmppRunOnceWithTimeOut: timeout forContext: ctx.
			Processor yield.
			interval asDelay wait.
			self class isInterrupted ifTrue: [ ].
			self flag: #WAIT.
			count := count + 1].
		
	self logEventLoopEnded.

	self releaseConnection ] forkNamed: 'Xmpp Loop'
