public class PushToQueueRequest extends ApplicationRequest
{
	private String content;
	public String getMessageContent()
	{
		return content;
	}
	public PushToQueueRequest(String queueName,String content)
	{	
		super(queueName);
		this.content = content;
	}
	
}
