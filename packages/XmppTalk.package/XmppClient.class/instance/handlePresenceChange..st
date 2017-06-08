callbacks-xep-handlers
handlePresenceChange: stanzaOpaqueObject
	| incomingStanzaId from replyStanzaOpaqueObject to todo show status |
	from := self getStanzaFromAttribute: stanzaOpaqueObject.
	incomingStanzaId := self getStanzaId: stanzaOpaqueObject.
	from := self getStanzaFromAttribute: stanzaOpaqueObject.
	
	"read show and status children"
	show := 'TBD'.
	status := 'TBD'.
	"no need to answer anything, but useful to update presence list"
	
	todo := '<presence from="alice@wonderland.lit/rabbithole" to="sister@realworld.lit">
  <show>xa</show>
  <status>down the rabbit hole!</status>
</presence>'.

	^1
	
		
