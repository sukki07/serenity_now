public interface Message{
	public int getMessageId();
	public void setMessageId(int number);
	public String getMessageContent();
	public void setMessageContent(String content);
	public long getInvisibilityMinutes();
	public void setInvisibilityMinutes(long minutes);
	public long getEnqueueTime();
	public void setEnqueueTime(long enqueueTime);
}
