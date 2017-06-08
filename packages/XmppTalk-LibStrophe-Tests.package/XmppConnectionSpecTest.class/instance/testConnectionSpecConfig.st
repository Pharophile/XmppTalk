tests
testConnectionSpecConfig

	| connectionSpec |
	connectionSpec := StropheConnectionSpec new.
	connectionSpec 
		beLegacySsl;
		beDisableTls;
		beMandatoryTls;
		beTcpKeepAlive;
		jid: 'philippeback';
		pass: 'whoknew';
		host: 'somejabber.somewhere.com';
		nick: 'pharobot';
		yourself.
		
	self assert: connectionSpec tcpKeepalive equals: 1.
	self assert: connectionSpec jid equals: 'philippeback'.
	self assert: connectionSpec pass equals: 'whoknew'.
	self assert: connectionSpec host equals: 'somejabber.somewhere.com'.
	self assert: connectionSpec nick equals: 'pharobot'.
	self shouldnt: (connectionSpec flags = 0) description: 'We set flags, so cannot be 0'
		