accessing-defaults
localConnectionSpec
	| connSpec |
	connSpec := StropheConnectionSpec new.
	connSpec
		jid: 'pharo@vmfractal/PharoIDE';
		pass: 'pharo';
		host: 'vmfractal';
		nick: 'Pharo Bot'.
	^ connSpec