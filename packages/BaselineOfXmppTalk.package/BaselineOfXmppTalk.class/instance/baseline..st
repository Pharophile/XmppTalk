baselines
baseline: spec
	<baseline>

	spec for: #'common' do: [
		spec 
		   baseline: 'Beacon' with: [ 
				spec 
					repository: 'github://pharo-project/pharo-beacon/repository';
					loads: #default ];
			configuration: 'RunCase' with: [ 
				spec
					repository: 'http://smalltalkhub.com/mc/philippeback/RunCase/main';
					versionString: #development ];

			package: #'XmppTalk-XmppLogEvents';
			package: #'XmppTalk-ExternalStructures';

			package: #'XmppTalk-LibStrophe' with: [ 
				spec requires: #( 'XmppTalk-ExternalStructures' ) ];
			package: #'XmppTalk-LibStrophe-Tests' with: [
				spec requires: #( 'XmppTalk-ExternalStructures' 'XmppTalk-LibStrophe' ) ];
			
			package: #'XmppTalk-XmppClient' with: [
				spec requires: #( 
					'XmppTalk-ExternalStructures' 
					'XmppTalk-LibStrophe' 
					'XmppTalk-XmppLogEvents' ) ];

			package: #'XmppTalk-XmppClient-GUI';

			package: #'XmppTalk-XmppClient-RunCase' with: [
				spec requires: #( 
					'XmppTalk-LibStrophe' 
					'XmppTalk-XmppClient' 
					'XmppTalk-XmppLogEvents'
					'RunCase' ) ];

			group: 'Core' with: #( 'XmppTalk-XmppClient' 'XmppTalk-XmppClient-GUI' );
			group: 'Tests' with: #( 'XmppTalk-LibStrophe-Tests' 'XmppTalk-XmppClient-RunCase' );
			group: 'default' with: #( 'Core' 'Tests' ) ].
