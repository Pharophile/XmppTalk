tasks
runXmppBasicLoop
	| period interval times count timeout |
	
	xmppClient := (XmppClient new) connSpec: self localConnectionSpec; yourself.
	xmppClient inspect.

	xmppClient configureConnection.
	
	"run is too much for a test"
	period := 90 seconds.
	interval := 200 milliSeconds.
	timeout := 1000. "milliseconds but FFI thing"

	xmppClient logEventLoopStartedForPeriodOf: ( period := 90 seconds ) withInterval: ( interval := 200 milliSeconds ). 
	count := 1.
	times := period asMilliSeconds / interval asMilliSeconds.
	[(count <= times) and: [ XmppClient isInterrupted not ] ]
		whileTrue: 	[
			"self termOut: 'About to run once'."
			xmppClient runLoopOnceWithTimeOut: timeout.
			xmppClient sendPendingMessages.
			World doOneCycle.
			"self termOut: 'Waiting'."
			interval asDelay wait.
			count := count + 1].
		
	xmppClient logEventLoopEnded.

	xmppClient releaseConnection
