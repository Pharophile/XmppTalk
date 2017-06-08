tests
testXmppInitialize

	| lib |


	lib := StropheLib uniqueInstance.
	
	lib xmppInitialize.
	lib xmppShutdown.
