testing
isInterrupted
	^ Interrupt ifNil: [ Interrupt := false ]