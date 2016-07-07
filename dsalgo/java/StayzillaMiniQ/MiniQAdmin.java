import java.util.HashMap;
public class MiniQAdmin {
	private static MiniQAdmin admin = new MiniQAdmin();
	private MiniQServer server;
	private Map<String,MiniQ> mapForAllAvailableQueues;
	private MiniQAdmin()
	{
		server  = new MiniQServer();;
		mapForAllAvailableQueues = new HashMap<String,MiniQ>();
	}
	public MiniQAdmin getInstance()
	{
		return admin;
	}
	public MiniQServer getServer()
	{
		return server;
	}

	public ApplicationObject getResponseObjectForRequestObject(ApplicationObject applicationRequestObject)
	{
		String queueName = applicationRequestObject.getQueueName();
		if (applicationRequestObject instance_of CreateQueueRequest)
		{
			MiniQ queueObj = createGetQueue(String queueName);
			ApplicationObject createQueueResponse = new CreateQueueResponse();  
			createQueueResponse.setStatus = true;
			return createQueueResponse;
		}
		else if (applicationRequestObject instance_of DeleteQueueRequest)
		{
			boolean wasDeleted = deleteQueue(queueName);
			ApplicationObject deleteQueueResponse = new DeleteQueueResponse();  
			if (wasDeleted == true)
			{
			deleteQueueResponse.setStatus = true;
			}
			else
			{
			deleteQueueResponse.setStatus = false;
			deleteQueueResponse.setReason = "No Such Queue";
			}
			return deleteQueueResponse;

		}
		else if (applicationRequestObject instance_of PushToQueueRequest)
		{
			MiniQ queueObj = createGetQueue(String queueName);
			Message newMessage = PushToQueueRequest.getMessage();
			queueObj.enqueue(newMessage);
			ApplicationObject pushToQueueResponse = new PushToQueueResponse();  
			pushToQueueResponse.setStatus = true;
			return pushToQueueResponse;
		}
		else if (applicationRequestObject instance_of PopFromQueueRequest)
		{
			MiniQ queueObj = createGetQueue(String queueName);
			Message msg = queueObj.dequeue();
			ApplicationObject popFromQueueResponse = new PopFromQueueResponse();  
			popFromQueueResponse.setStatus = true;
			popFromQueueResponse.setMessage = msg;
			return popFromQueueResponse;
		}
		else if (applicationRequestObject instance_of DeleteFromQueueRequest)
		{
			MiniQ queueObj = createGetQueue(String queueName);
			String msgId = DeleteFromQueueRequest.getMessageId();
			boolean wasDeleted = queueObj.deleteById(msgId);
			ApplicationObject deleteFromQueueResponse = new DeleteFromQueueResponse();  
			if (wasDeleted == true)
			{
				deleteFromQueueResponse.setStatus = true;
			}
			else
			{
				deleteFromQueueResponse.setStatus = false;
				deleteFromQueueResponse.setReason = "Message already timedout";
			}
			return deleteFromQueueResponse;

		}

	}


	private synchronized boolean deleteQueue(String queueName)
	{
		MiniQ queue = mapForAllAvailableQueues.get(queueName);
		if ( queue!= null)
		{
			 mapForAllAvailableQueues.set(queueName,null);
			 return true;
		}
		else
		{
			return false;
		}
	}


	private synchronized MiniQ createGetQueue(String queueName)
	{
		MiniQ queue = mapForAllAvailableQueues.get(queueName);
		if ( queue!= null)
		{
			return  queue;
		}
		else
		{
			//later read from config QueueType
			String queueType = "InMemoryQueue";
			queue = new InMemoryQueue(queueName);
			mapForAllAvailableQueues.put(queueName,queue);
			return queue;
		}

	}

	public static void main(String[] args) {
		int port = Integer.parseInt(args[0]);
		admin = MiniQAdmin.getInstance();
		admin.getServer().start(port);
	}
}

