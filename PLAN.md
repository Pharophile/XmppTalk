Investigate crash in auth.c:965 (which is at the end).

[Done] No need, issue was UFFI related--> add debugging info into auth.c, recompile it all with symbols etc (32 bit container)

[Done] Wrap connection, log, and context in a single object so that one does not have to pass it around all the time.

[Todo] Make basic GUI so that we can use it

[Todo] Move XmppLogEvent to BeaconSignal for better logging support
