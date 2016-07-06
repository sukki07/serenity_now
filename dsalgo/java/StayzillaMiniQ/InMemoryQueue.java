import java.util.concurrent;

public class InMemoryQueue implements MiniQ
{
	private ConcurrentLinkedQueue<Message> visibleMessages;
	private HashMap<String,Message> invisibleMessages;
	private int enqueueCount = 0;
	
	public InMemoryQueue()
	{
		visibleMessages = new LinkedBlockingQueue<Message>();
		invisibleMessages = new HashMap<String,Message>();
	}

	public String synchronized enqueue(Message msg)
	{
		enqueueCount+=1;
		msg.setMessageId(enqueueCount);
		visibleMessages.offer(msg);
	}

	public String synchronized dequeue(String msgId)
	{
		Message msg = visibleMessages.poll();
		if(!msg==null)
		{
			invisibleMessages.put(msgId,msg);
		}
		else
		{
			return "QUEUEISEMPTY";
		}
	}

}
