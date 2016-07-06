import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.BufferedReader;
import java.net.Socket;
import java.util.HashMap;


public class MiniQClientApplicationHandler implements Runnable {
	private TcpProtocol protocol;
	public MiniQClientHandler(TcpProtocol protocol) {
		this.protocol = protocol;
	}

	public HashMap<String,String> processCommand(HashMap<String,String> commandMap)
	{
		HashMap<String,String> responseMap= new HashMap<String,String>();

		String queueName = commandMap.get("queueName");
		String command = commandMap.get("command");
		String argument = commandMap.get("argument");
		MiniQ queue = MiniQAdmin.createGetQueue(queueName);
		if (command == "getMessage")
		{
			Message msg = queue.dequeue();

		}
		else if (command == "deleteMessage")
		{
			//queue.deleteById(argument);

		}
		else if (command == "putMessage")
		{
			Message msg = null;
			queue.enqueue(msg);
		}
		else
		{

		}
		return responseMap;

	}
	public void run() 
	{
		try {
			Object transportLayerRequestObject = protocol.processInputStream();
			Object applicationLayerRequestObject = protocol.getApplicationLayerObject();
			Object applicationLayerResponseObject = processCommand(applicationLayerObject);

			protocol.processOutputStream(responseMap);
		} catch (IOException e) {
		}
	}
}
