xmpp-version
xmppVersionCheckMajor:aMajorInt minor: aMinorInt
	"Check that Strophe supports a specific API version.
	 if the version is supported and 0 if unsupported
	"
	^self ffiCall: #(int xmpp_version_check(int aMajorInt, int aMinorInt) )
