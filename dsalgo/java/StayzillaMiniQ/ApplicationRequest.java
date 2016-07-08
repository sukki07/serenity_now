public class ApplicationRequest extends MiniQApplicationApi 
{
	private String queueName;
	public String getQueueName()
	{
		return queueName;	
	}
	public ApplicationRequest(String queueName)
	{
		this.queueName = queueName;
	}
	public ApplicationRequest()
	{
	}
}
