import java.net.ServerSocket;
import java.net.Socket;
import java.io.IOException;

public class MiniQServer {
	private ServerSocket clientSocketListener;
	private int serverPort;
	public void setPort(int port)
	{
		this.serverPort = port;
		try{
			clientSocketListener = new ServerSocket(port);
		}
		catch(IOException e)
		{
			e.printStackTrace(System.out);

		}
	}
	public void start()
	{
		try {
			while (true) {
				Socket clientSocket = clientSocketListener.accept();
				TcpProtocol protocol = new MiniQOverTcp(clientSocket);	
				MiniQClientApplicationHandler miniQClientHandler = new MiniQClientApplicationHandler(protocol);
				Thread clientThread = new Thread(miniQClientHandler);
				clientThread.start();               
			}

		} 
		catch(IOException e)
		{
			e.printStackTrace(System.out);

		}
		finally {
			try{
				clientSocketListener.close();
			}
			catch(IOException e)
			{
				e.printStackTrace(System.out);
			}
		}

	}
}
