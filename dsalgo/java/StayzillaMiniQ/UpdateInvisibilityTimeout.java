import java.util.TimerTask;
import java.util.Date;
import java.util.Iterator;
import java.util.HashMap;
public class UpdateInvisibilityTimeout extends TimerTask
{
	private MiniQ queue;
	public void run()
	{

		System.out.println(String.format("running timer task for queue %s",queue.getQueueName()));
		HashMap<Integer,Message> messages = (HashMap<Integer,Message>)queue.getInvisibleMessages();
		Iterator<Integer> it = messages.keySet().iterator();
		while(it.hasNext())
		{
			Integer key = it.next();
			Message msg = messages.get(key);
			long enqueueTime = msg.getEnqueueTime();
			long currentTime = new Date().getTime();
			long diffInSeconds = ((currentTime - enqueueTime)/1000);
			long invisibilityMinutes = msg.getInvisibilityMinutes(); 
			System.out.println(String.format("%d",diffInSeconds));
			if (diffInSeconds >= (invisibilityMinutes*60))
			{
				System.out.println("Message expired,re-enqueing");
				it.remove();
				String content = msg.getMessageContent();
				queue.enqueue(content);
			}
		}
	}
	public UpdateInvisibilityTimeout(MiniQ queue) 
	{
		this.queue = queue;
	}

}

