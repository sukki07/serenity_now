import java.net.ServerSocket;
import java.net.Socket;
import java.io.IOException;

public class MiniQServer {
	private ServerSocket clientSocketListener;
	private int serverPort;
	public MiniQServer(port)
	{
		try{
			this.serverPort = port;
			clientSocketListener = new ServerSocket(port);
		}
		catch(IOException e)
		{

		}

	}
	public void start()
	{
		try {
			while (true) {
				Socket clientSocket = clientSocketListener.accept();
				if (serverPort == 80)
				{
					TcpProtocol protocol = new HTTPProtocol(clientSocket);	
				}
				else
				{
					TcpProtocol protocol = new CsvProtocol(clientSocket);	
				}

				MiniQClientApplicationHandler miniQClientHandler = new MiniQClientApplicationHandler(protocol);
				Thread clientThread = new Thread(miniQClientHandler);
				clientThread.start();               
			}

		} 
		catch(IOException e)
		{

		}
		finally {
			try{
				clientSocketListener.close();
			}
			catch(IOException e)
			{

			}
		}

	}
}
