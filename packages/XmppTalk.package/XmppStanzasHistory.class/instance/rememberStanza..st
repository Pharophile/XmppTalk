as yet unclassified
rememberStanza: aStanzaInfo
	self flag: #TODO. "Manage history ids better"
	self history at: self nextId put: aStanzaInfo 
	