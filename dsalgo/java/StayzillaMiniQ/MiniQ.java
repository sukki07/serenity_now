public interface MiniQ
{
	public String enqueue(String content);
	public ClientMessage dequeue();
	public String getQueueName();
	public MiniQ createQueue(String queueName);
}
