callbacks-registration
registerCallbacks
	"Register all callbacks. Callback registration only puts the callbacks into the callbacks registry.
	In order to have the callbacks actually handling incoming stuff, one has to register handlers"
	
	self registerCallback: self connHandlerCallback named: #connHandler.
	self registerCallback: self versionHandlerCallback named: #versionHandler.
	self registerCallback: self discoInfoHandlerCallback named: #discoInfoHandler.
	self registerCallback: self pingHandlerCallback named: #pingHandler.
	self registerCallback: self timeHandlerCallback named: #timeHandler.
	self registerCallback: self messageHandlerCallback named: #messageHandler.
	self registerCallback: self presenceHandlerCallback named: #presenceHandler.
	self registerCallback: self presenceChangeHandlerCallback named: #presenceChangeHandler