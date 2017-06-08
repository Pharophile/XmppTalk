accessing
conn
	"Returns the conn object for this connection to the Xmpp server.
	Avoids having to pass it around all the time"
	conn ifNil: [ Error signal: 'Xmpp conn not initialized' ].
	^conn