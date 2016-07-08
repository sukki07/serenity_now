import java.util.HashMap;
import java.util.Map;
public class MiniQAdmin {
	private static final MiniQAdmin admin = new MiniQAdmin();
	private MiniQServer server;
	private Map<String,MiniQ> mapForAllAvailableQueues;
	private MiniQAdmin()
	{
		server  = new MiniQServer();
		mapForAllAvailableQueues = new HashMap<String,MiniQ>();
	}
	public static MiniQAdmin getInstance()
	{
		return admin;
	}
	public MiniQServer getServer()
	{
		return server;
	}

	public ApplicationResponse getResponseObjectForRequestObject(ApplicationRequest applicationRequestObject)
	{
		System.out.println("processing request");
		ApplicationResponse response = null; 
		String queueName = applicationRequestObject.getQueueName();
		if (applicationRequestObject instanceof CreateQueueRequest)
		{
			MiniQ queueObj = createGetQueue(queueName);
			ApplicationResponse createQueueResponse = new CreateQueueResponse();  
			createQueueResponse.setStatus(true);
			response = createQueueResponse;
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
			response = deleteQueueResponse;

		}
		else if (applicationRequestObject instanceof PushToQueueRequest)
		{
			MiniQ queueObj = createGetQueue(queueName);
			String messageContent = ((PushToQueueRequest)applicationRequestObject).getMessageContent();
			queueObj.enqueue(messageContent);
			ApplicationResponse pushToQueueResponse = new PushToQueueResponse();  
			pushToQueueResponse.setStatus(true);
			response = pushToQueueResponse;
		}
		else if (applicationRequestObject instanceof PopFromQueueRequest)
		{
			MiniQ queueObj = createGetQueue(queueName);
			ClientMessage msg = queueObj.dequeue();
			PopFromQueueResponse popFromQueueResponse = new PopFromQueueResponse();  
			popFromQueueResponse.setStatus(true);
			popFromQueueResponse.setClientMessage(msg);
			response = popFromQueueResponse;
		}
		else if (applicationRequestObject instanceof DeleteFromQueueRequest)
		{
			MiniQ queueObj = createGetQueue(queueName);
			int msgId = ((DeleteFromQueueRequest)applicationRequestObject).getMessageId();
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
			response = deleteFromQueueResponse;
		}
		return response;

	}


	private synchronized boolean deleteQueue(String queueName)
	{
		MiniQ queue = mapForAllAvailableQueues.get(queueName);
		if ( queue!= null)
		{
			 mapForAllAvailableQueues.put(queueName,null);
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
			System.out.println("Creating queue");
			String queueType = "InMemoryQueue";
			queue = new InMemoryQueue(queueName);
			mapForAllAvailableQueues.put(queueName,queue);
			return queue;
		}

	}
	public static void main(String[] args) {
		int port = Integer.parseInt(args[0]);
		MiniQAdmin adminRef = MiniQAdmin.getInstance();
		MiniQServer server = adminRef.getServer();
		server.setPort(port);
		server.start();
	}
}

