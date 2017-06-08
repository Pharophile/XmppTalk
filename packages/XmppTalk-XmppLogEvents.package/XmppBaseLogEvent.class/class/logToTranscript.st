convenience
logToTranscript
	self stopLoggingToTranscript.
	^ self announcer when: XmppBaseLogEvent do: [ :event | Transcript crShow: event ].