import java.net.Socket;
import java.io.PrintWriter;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;
import java.util.HashMap;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.lang.ClassNotFoundException;
public class MiniQOverTcp implements TcpProtocol 
{
	private Socket clientSocket;
	public MiniQOverTcp(Socket clientSocket)
	{
		this.clientSocket = clientSocket;	
	}
	public void processSocketOutput(MiniQApplicationApi applicationResponseObject)
	{
		try{
		ObjectOutputStream outputStream = new ObjectOutputStream(clientSocket.getOutputStream());
		System.out.println(String.format("Going to write object %s",applicationResponseObject.getClass()));
		outputStream.writeObject(applicationResponseObject);
		}
		catch(IOException e)
		{
			e.printStackTrace(System.out);

		}
	}
	public MiniQApplicationApi processSocketInput() 
	{
		MiniQApplicationApi applicationRequestObject = null;
		try{
			ObjectInputStream inStream = new ObjectInputStream(clientSocket.getInputStream());
			applicationRequestObject =  (MiniQApplicationApi)inStream.readObject();
			System.out.println(String.format("Going to read object %s",applicationRequestObject.getClass()));
		}
		catch(IOException|ClassNotFoundException e)
		{
			e.printStackTrace(System.out);

		}
		return applicationRequestObject;
	}
}
