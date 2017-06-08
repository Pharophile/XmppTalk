actions
sendMessage: aMessageString to: aJid


		self messagesToSend add: { #tojid -> aJid. #payload -> aMessageString } asDictionary
