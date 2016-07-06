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
		if (applicationRequestObject instance_of CreateQueueRequest)
		{

		}
		else if (applicationRequestObject instance_of DeleteQueueRequest)
		{
		}
		else if (applicationRequestObject instance_of PushToQueueRequest)
		{
		}
		else if (applicationRequestObject instance_of PopFromQueueRequest)
		{
		}
		else if (applicationRequestObject instance_of DeleteFromQueueRequest)
		{
		}
		else
		{

		}

	
	}


	public synchronized MiniQ createGetQueue(String queueName)
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

