import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;


public class MiniQClientHandler implements Runnable {
	private Socket clientSocket;
	private TransferProtocol protocol;
	
	public MiniQClientHandler(Socket clientSocket) {
		this.clientSocket = clientSocket;
	}
	
	public void run()
	{
		try {
			BufferedReader in = new BufferedReader(	new InputStreamReader(clientSocket.getInputStream()));
			PrintWriter out = new PrintWriter(clientSocket.getOutputStream(), true);
			String input = in.readLine();
			String output = protocol.parse(input)
			out.println(output);
		} catch (IOException e) {


		} finally {
			try {
				clientSocket.close();
			} catch (IOException e) {

			}

		}
	}
}
