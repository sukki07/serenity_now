import java.util.HashMap;
import java.util.Map;
public class MiniQAdmin {
	private static MiniQAdmin admin = new MiniQAdmin();
	private MiniQServer server;
	private Map<String,MiniQ> mapForAllAvailableQueues;
	private MiniQAdmin()
	{
		server  = new MiniQServer();
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

	public ApplicationResponse getResponseObjectForRequestObject(ApplicationRequest applicationRequestObject)
	{
		String queueName = applicationRequestObject.getQueueName();
		if (applicationRequestObject instanceof CreateQueueRequest)
		{
			MiniQ queueObj = createGetQueue(queueName);
			ApplicationResponse createQueueResponse = new CreateQueueResponse();  
			createQueueResponse.setStatus(true);
			return createQueueResponse;
		}
		else if (applicationRequestObject instanceof DeleteQueueRequest)
		{
			boolean wasDeleted = deleteQueue(queueName);
			ApplicationResponse deleteQueueResponse = new DeleteQueueResponse();  
			if (wasDeleted == true)
			{
			deleteQueueResponse.setStatus(true);
			}
			else
			{
			deleteQueueResponse.setStatus(false);
			}
			return deleteQueueResponse;

		}
		else if (applicationRequestObject instanceof PushToQueueRequest)
		{
			MiniQ queueObj = createGetQueue(queueName);
			String messageContent = PushToQueueRequest.getMessageContent();
			queueObj.enqueue(messageContent);
			ApplicationResponse pushToQueueResponse = new PushToQueueResponse();  
			pushToQueueResponse.setStatus(true);
			return pushToQueueResponse;
		}
		else if (applicationRequestObject instanceof PopFromQueueRequest)
		{
			MiniQ queueObj = createGetQueue(queueName);
			ClientMessage msg = queueObj.dequeue();
			ApplicationResponse popFromQueueResponse = new PopFromQueueResponse();  
			popFromQueueResponse.setStatus(true);
			popFromQueueResponse.setClientMessage(msg);
			return popFromQueueResponse;
		}
		else if (applicationRequestObject instanceof DeleteFromQueueRequest)
		{
			MiniQ queueObj = createGetQueue(queueName);
			String msgId = DeleteFromQueueRequest.getMessageId();
			boolean wasDeleted = queueObj.deleteById(msgId);
			ApplicationResponse deleteFromQueueResponse = new DeleteFromQueueResponse();  
			if (wasDeleted == true)
			{
				deleteFromQueueResponse.setStatus(true);
			}
			else
			{
				deleteFromQueueResponse.setStatus(false);
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
		MiniQServer server = admin.getServer();
		server.setPort(port);
		server.start();
	}
}

