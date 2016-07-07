import java.net.Socket;
import java.io.PrintWriter;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;
import java.util.HashMap;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
public class MiniQOverTcp implements TcpProtocol 
{
	private Socket clientSocket;
	public MiniQOverTcp(Socket clientSocket)
	{
		this.clientSocket = clientSocket;	
	}
	public void processSocketOutput(MiniQApplicationApi applicationResponseObject)
	{
		ObjectOutputStream outputStream = new ObjectOutputStream(clientSocket.getOutputStream());
		outputStream.writeObject(applicationResponseObject);
	}
	public MiniQApplicationApi processSocketInput() throws IOException
	{
		try{
			ObjectInputStream inStream = new ObjectInputStream(clientSocket.getInputStream());
			MiniQApplicationApi applicationRequestObject =  (MiniQApplicationApi)inStream.readObject();
			return applicationRequestObject;
		}
		catch(IOException e )
		{
			throw e;
		}
	}
}
