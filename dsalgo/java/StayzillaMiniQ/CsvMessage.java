public class CsvMessage implements Message{
	private String content;
	public CsvMessage(String content)
	{
		this.content = content;
	}
	public String getMessageId()
	{
		return "";
	}
	public String setMessageId(int id)
	{
		return "";
	}
	public Object getMessageContent()
	{
		
		return "";
	}
	public Integer getMessageVisibility()
	{
		return 1;
	}
	public void setMessageVisibility()
	{
	}

}
