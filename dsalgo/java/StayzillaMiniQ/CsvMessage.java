public class CsvMessage implements Message{
	private String content;
	public CsvMessage(String content)
	{
		this.content = content;
	}
	public String getMessageId();
	public String setMessageId();
	public Object getMessageContent();
	public Integer getMessageVisibility();
	public void setMessageVisibility();

}
