public class MiniQMessage implements Message
{
	private int messageId;
	private String content;
	private long enqueueTime;
	private long invisibilityMinutes;
	public int getMessageId()
	{
		return messageId;
	}
	public void setMessageId(int number)
	{
		this.messageId = number;
	}
	public String getMessageContent()
	{
		return content;
	}
	public void setMessageContent(String content)
	{
		this.content = content;
	}
	public long getInvisibilityMinutes()
	{
		return invisibilityMinutes;
	}
	
	public void setInvisibilityMinutes(long minutes)
	{
		this.invisibilityMinutes = minutes; 
	}
	
	public long getEnqueueTime()
	{

		return enqueueTime;
	}
	public void setEnqueueTime(long enqueueTime)
	{

		this.enqueueTime = enqueueTime; 
	}

}

