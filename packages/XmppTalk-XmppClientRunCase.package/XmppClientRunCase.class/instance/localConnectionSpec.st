accessing-defaults
localConnectionSpec
	connSpec := StropheConnectionSpec new.
	connSpec
		jid: 'pharo@localhostl/PharoIDE';
		pass: 'pharo';
		host: 'localhost';
		nick: 'Pharo Bot'.
	^ connSpec