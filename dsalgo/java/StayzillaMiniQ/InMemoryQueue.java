import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.HashMap;
import java.util.Timer;
import java.util.Date;
import java.util.TimerTask;

public class InMemoryQueue implements MiniQ
{
	private ConcurrentLinkedQueue<Message> visibleMessages;
	private HashMap<Integer,Message> invisibleMessages;
	private int enqueueCount = 0;
	private String queueName;
	private Timer updateTimer;

	
	public HashMap<Integer,Message> getInvisibleMessages() 	
	{
		return invisibleMessages;
	}
	
	
	public String getQueueName()
	{
		return queueName;
	}
	

	public InMemoryQueue(String queueName)
	{
		this.queueName = queueName;
		this.visibleMessages = new ConcurrentLinkedQueue<Message>();
		this.invisibleMessages = new HashMap<Integer,Message>();
		this.updateTimer = new Timer();
		TimerTask updateTask = new UpdateInvisibilityTimeout(this);
		System.out.println("Starting timer");
		updateTimer.schedule(updateTask,0,6000);
	}

	public synchronized String enqueue(String content)
	{
		enqueueCount+=1;
		System.out.println(String.format("Enqueuing Message number %d",enqueueCount));
		Message msg = new MiniQMessage();
		msg.setMessageContent(content);
		msg.setMessageId(enqueueCount);
		msg.setInvisibilityMinutes((long)1);
		msg.setEnqueueTime(new Date().getTime());
		visibleMessages.offer(msg);
		return "";
	}

		
	public synchronized ClientMessage dequeue()
	{
		Message msg = visibleMessages.poll();
		int msgId = msg.getMessageId();
		String content = msg.getMessageContent();
		if(msg!=null)
		{
			invisibleMessages.put(msgId,msg);
			ClientMessage clientMessage = new ClientMessage(content,msgId);
			return clientMessage; 
		}
		else
		{
			return null;
		}
	}
	
	public synchronized boolean deleteById(int id)
	{
		Message msg = invisibleMessages.get(id);
		if(msg!=null) 
		{
			invisibleMessages.remove(id);
			return true;
		}
		else
		{
			return false;
		}
	}

}
