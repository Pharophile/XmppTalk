accessing
ctx
	"Returns the Strophe context"
	ctx ifNil: [ Error signal: 'Xmpp context not initialized' ].
	^ctx