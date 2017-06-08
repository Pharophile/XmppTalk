as yet unclassified
exampleXmppVersionCheck

	| lib |


	lib := StropheLib uniqueInstance.
	
	lib xmppInitialize.
	(lib xmppVersionCheckMajor: 10 minor: 56) inspect.
	(lib xmppVersionCheckMajor: 0 minor: 0) inspect.
	lib xmppShutdown.
