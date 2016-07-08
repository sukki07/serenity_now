public class MiniQTest{
	public static void main(String[] args)
	{
		String serverIP = "127.0.0.1";
		int serverPort = 9898;
		MiniQClient client = new MiniQClient(serverIP,serverPort);
		String queueName = null;
		CreateQueueRequest  createQueueRequest = null;
		PushToQueueRequest  pushToQueueRequest = null;
		PopFromQueueRequest popFromQueueRequest = null;
		PopFromQueueResponse  popFromQueueResponse = null;
		DeleteFromQueueResponse deleteFromQueueResponse = null;
		
		
		queueName = "MyFirstQueue";
		createQueueRequest = new CreateQueueRequest(queueName);
		pushToQueueRequest = new PushToQueueRequest(queueName,"First");
		popFromQueueRequest = new PopFromQueueRequest(queueName);
		client.createQueue(createQueueRequest);
		client.pushToQueue(pushToQueueRequest);
		client.popFromQueue(popFromQueueRequest);
		
		//DeleteFromQueueRequest deleteFromQueueRequest = new DeleteFromQueueRequest(queueName,1);




		 queueName = "MySecondQueue";
		createQueueRequest = new CreateQueueRequest(queueName);
		pushToQueueRequest = new PushToQueueRequest(queueName,"Second");
		popFromQueueRequest = new PopFromQueueRequest(queueName);
		client.createQueue(createQueueRequest);
		client.pushToQueue(pushToQueueRequest);
		client.popFromQueue(popFromQueueRequest);




		//deleteFromQueueResponse = client.deleteMessageWithId(deleteFromQueueRequest);
		//System.out.println(deleteFromQueueResponse.getStatus());
	}
	public static void  printResponse(PopFromQueueResponse response)
	{
		String poppedMessageContent = response.getClientMessage().getMessageContent();
		System.out.println(poppedMessageContent);
	}
}

