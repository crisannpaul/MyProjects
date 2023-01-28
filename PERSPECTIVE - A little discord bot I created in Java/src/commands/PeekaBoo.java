package commands;

import net.dv8tion.jda.api.events.message.MessageReceivedEvent;
import net.dv8tion.jda.api.hooks.ListenerAdapter;

public class PeekaBoo extends ListenerAdapter{
	
	public void onMessageRecieved(MessageReceivedEvent event) {
		if(event.getMessage().getContentRaw().equalsIgnoreCase("peeka")) {
			event.getChannel().sendMessage("boo");
		}
	}

}
