package;

import sys.thread.Thread;
import Sys.sleep;
import discord_rpc.DiscordRpc;

class Discord
{
    public function new()
    {
        DiscordRpc.start({
            clientID: "942728867100123146",
			onReady: OnReady,
            onDisconnected: OnDisconnect,
            onError: OnError
        });

        while (true)
        {
            DiscordRpc.process();
            sleep(1);
        }

        DiscordRpc.shutdown();
    }

    public static function NewInstance()
    {
        var SexyDiscordRPC = Thread.create(() ->
		{
			new Discord();
		});
    }

    public function OnReady()
    {
        trace("Discord Setup Successful");
        #if LOGIN_ALLOWED
        UpdateStatus("Logging Into A Sentinel Engine Account", null);
        #else
        UpdateStatus("In The Intro Menu", null);
        #end
    }

    public function OnDisconnect(_code:Int, _message:String)
    {
        trace("Discord Client Disconnected. Client Returned Code" + _code + " - " + _message);
    }

    public function OnError(_code:Int, _message:String)
    {
        trace("Discord Client Crashed! Client Returned ERROR " + _code + " - " + _message);
    }

    public static function UpdateStatus(details:String, state:String)
    {
        DiscordRpc.presence({
            details: details,
            state: state,
            largeImageKey: "title-card",
            largeImageText: "Sentinel Engine"
        });
        trace("Discord Rich Presence Updated To " + details + " - " + state);
    }
}