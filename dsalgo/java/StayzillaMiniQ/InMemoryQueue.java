import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.HashMap;

public class InMemoryQueue implements MiniQ
{
	private ConcurrentLinkedQueue<Message> visibleMessages;
	private HashMap<String,Message> invisibleMessages;
	private int enqueueCount = 0;
	private String queueName;

	public String getQueueName()
	{
		return queueName;
	}
	public MiniQ createQueue(String queueName)
	{
		return (MiniQ)(new InMemoryQueue(queueName));
	}

	public InMemoryQueue(String queueName)
	{
		this.queueName = queueName;
		this.visibleMessages = new ConcurrentLinkedQueue<Message>();
		this.invisibleMessages = new HashMap<String,Message>();
	}

	public synchronized String enqueue(Message msg)
	{
		enqueueCount+=1;
		msg.setMessageId(enqueueCount);
		visibleMessages.offer(msg);
		return "";
	}

	public synchronized Message dequeue()
	{
		Message msg = visibleMessages.poll();
		String msgId = msg.getMessageId();
		if(msg!=null)
		{
			invisibleMessages.put(msgId,msg);
			return msg; 
		}
		else
		{
			return null;
		}
	}
	
	public synchronized Message deleteById(String id)
	{
		Message msg = visibleMessages.poll();
		String msgId = msg.getMessageId();
		if(msg!=null)
		{
			invisibleMessages.put(msgId,msg);
			return msg; 
		}
		else
		{
			return null;
		}
	}




}
