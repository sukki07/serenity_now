import java.io.IOException;
import java.net.Socket;
import java.net.UnknownHostException;
public class MiniQClient {
	private String serverIp;
	private int serverPort;
	public MiniQClient(String serverIp,int serverPort)
	{
		this.serverIp = serverIp;
		this.serverPort = serverPort;
	}


	public ApplicationResponse commonRequest(ApplicationRequest request)
	{
		ApplicationResponse res = null;
		try {
			Socket socket = new Socket(serverIp,serverPort);
			TcpProtocol protocol = new MiniQOverTcp(socket);
			protocol.processSocketOutput(request);
			res = (ApplicationResponse)protocol.processSocketInput();
			socket.close();
		}
		catch(IOException e)
		{
			e.printStackTrace(System.out);
		}
		return res;
	}



	public DeleteFromQueueResponse deleteMessageWithId(DeleteFromQueueRequest request)
	{
			ApplicationResponse response = commonRequest(request);
			return (DeleteFromQueueResponse)response;
	}
	public CreateQueueResponse createQueue(CreateQueueRequest request) 
	{
			ApplicationResponse response = commonRequest(request);
			return (CreateQueueResponse)response;
	}
	public PushToQueueResponse pushToQueue(PushToQueueRequest request) 
	{
			ApplicationResponse response = commonRequest(request);
			return (PushToQueueResponse)response;
	}
	public PopFromQueueResponse popFromQueue(PopFromQueueRequest request) 
	{
			ApplicationResponse response = commonRequest(request);
			return (PopFromQueueResponse)response;
	}


}
