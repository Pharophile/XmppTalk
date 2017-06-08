callbacks-management
registerCallback: anFFICallback named: aSymbol 

	self callbackRegistry at: aSymbol ifAbsentPut: anFFICallback.
	