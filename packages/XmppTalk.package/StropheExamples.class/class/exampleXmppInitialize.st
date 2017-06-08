as yet unclassified
exampleXmppInitialize

	| lib |


	lib := StropheLib uniqueInstance.
	
	lib xmppInitialize.
	lib xmppShutdown.
