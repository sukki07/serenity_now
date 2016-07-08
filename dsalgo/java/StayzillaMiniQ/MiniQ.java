import java.util.Map;
public interface MiniQ
{
	public String enqueue(String content);
	public ClientMessage dequeue();
	public String getQueueName();
	public boolean deleteById(int msgId);
	public Map<Integer,Message> getInvisibleMessages(); 	
}
