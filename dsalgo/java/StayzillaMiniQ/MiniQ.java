public interface MiniQ
{
	public String synchronized enqueue(String msg);
	public String synchronized dequeue(String msgId);
	public String getQueueName();
}
