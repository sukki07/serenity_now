public class DeleteFromQueueRequest extends ApplicationRequest
{
	private int messageId;
	public int getMessageId() 
	{
		return messageId;
	}
	public DeleteFromQueueRequest(String queueName,int id)
	{
		super(queueName);
		this.messageId = id;
	}
}

