callbacks-management
callbackRegistry

	^ callbackRegistry ifNil: [ callbackRegistry := Dictionary new ]
	