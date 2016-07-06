import java.net.Socket;
import java.io.PrintWriter;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;
import java.util.HashMap;
public class CsvProtocol implements TransportProtocol
{
	private Socket clientSocket;
	public CsvProtocol(Socket clientSocket)
	{
		this.clientSocket = clientSocket;	
	}
	public void processSocketOutput(ApplicationObject applicationResponseObject);
	{
		TransportObject transportResponseObject = new  TransportObject(applicationResponseObject);
		outputStream = new ObjectOutputStream(clientSocket.getOutputStream());
		outputStream.writeObject(transportResponseObject);
	}
	public ApplicationObject processSocketInput() throws IOException
	{
		try{
			inStream = new ObjectInputStream(clientSocket.getInputStream());
			Object transportRequestObject =  (TransportObject)inStream.readObject();
			ApplicationObject applicationRequestObject =  transportRequestObject.getApplicationObject();
			return applicationRequestObject;
		}
		catch(IOException e )
		{
			throw e;
		}
	}
}
