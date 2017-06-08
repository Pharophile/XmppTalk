tests
testXmppLogger

	| lib log |


	lib := StropheLib uniqueInstance.
	
	lib xmppInitialize.
	self assert: (lib xmppVersionCheckMajor: 0 minor: 0) equals: 1.
	
	log := lib xmppGetDefaultLoggerForLevel: XMPP_LEVEL_DEBUG.
	
	log inspect.
	
	lib xmppShutdown.
