helpers
termOut: aString
	VTermOutputDriver stdout yellow: ('{now} -- {message}' format: { #message -> aString. #now ->  DateAndTime now } asDictionary); lf; flush.