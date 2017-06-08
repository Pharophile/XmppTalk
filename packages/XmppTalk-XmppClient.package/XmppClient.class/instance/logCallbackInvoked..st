logging
logCallbackInvoked: aCallbackId
	logLevel < 3 ifTrue: [ ^ nil ].
	^ (self newLogEvent: XmppCallbackInvokedEvent)
		callbackId: aCallbackId;
		emit