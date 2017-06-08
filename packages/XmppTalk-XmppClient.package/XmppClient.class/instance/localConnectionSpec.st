accessing-defaults
localConnectionSpec
	"An example spec"
	connSpec := StropheConnectionSpec new.
	connSpec
		jid: 'pharo@gravitation7/PharoIDE';
		pass: 'pharo';
		host: 'gravitation7';
		nick: 'Pharo Bot'.
	^ connSpec