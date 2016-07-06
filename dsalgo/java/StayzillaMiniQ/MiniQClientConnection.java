import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;
import java.io.IOException;
public class MiniQClientConnection {
	private Socket socket;
	public MiniQClientConnection() throws IOException 
	{
		this.socket = new Socket("127.0.0.1", 9898);

	}
	public String send(String fromUser) throws IOException 
	{
		String fromServer;
		try{
			BufferedReader in = new BufferedReader(	new InputStreamReader(socket.getInputStream()));
			PrintWriter  out = new PrintWriter(socket.getOutputStream(), true);
			out.println(fromUser);
			fromServer = in.readLine();
			return fromServer;
		}

		catch (IOException e) {
			// TODO: handle exception
			throw e;
		}
		finally {
			socket.close();
		}
	}
}
