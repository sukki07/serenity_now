public interface MiniQ
{
	public String enqueue(Message msg);
	public Message dequeue();
	public String getQueueName();
	public MiniQ createQueue(String queueName);
}
