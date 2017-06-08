tests
testXmppVersionCheck

	| lib |


	lib := StropheLib uniqueInstance.
	
	lib xmppInitialize.
	self assert: (lib xmppVersionCheckMajor: 10 minor: 56) equals: 0.
	self assert: (lib xmppVersionCheckMajor: 0 minor: 0) equals: 1.
	lib xmppShutdown.
