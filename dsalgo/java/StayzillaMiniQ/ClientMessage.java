public class ClientMessage implements java.io.Serializable {
	private String content;
	private int messageId;
	public String getMessageContent()
	{
		return content;
	}
	public int getMessageId()
	{
		return messageId;
	}
	public ClientMessage(String content,int messageId)
	{
		this.content = content;
		this.messageId = messageId;
	}
}
