accessing-defaults
slackHighOctaneConnectionSpec
	| connSpec |
	connSpec := StropheConnectionSpec new.
	connSpec
		jid: 'philippeback@highoctane.xmpp.slack.com';
		pass: 'highoctane.Otkt139QYC9uil5dgoEb';
		host: 'conference.highoctane.xmpp.slack.com';
		nick: 'philippeback'.
	^ connSpec
	
"    general (no hash sign) for the room name"
