event-loop-sending
sendPendingMessages
	"private"

	self flag: #TODO. "If we are disconnected, messages may be lost"
	self isConnected ifTrue: [ 
		self messagesToSend do: [ :message |
			self sendOneMessage: message 
			 ].
		self messagesToSend removeAll 
	]
	