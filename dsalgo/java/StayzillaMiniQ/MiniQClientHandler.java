import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;


public class MiniQClientHandler implements Runnable {
	private Socket clientSocket;
	
	public MiniQClientHandler(Socket clientSocket) {
		this.clientSocket = clientSocket;
	}
	
	public void run()
	{
		try {
			BufferedReader in = new BufferedReader(	new InputStreamReader(clientSocket.getInputStream()));
			PrintWriter out = new PrintWriter(clientSocket.getOutputStream(), true);
			String input = in.readLine();
			out.println(input.toUpperCase());
		} catch (IOException e) {


		} finally {
			try {
				clientSocket.close();
			} catch (IOException e) {

			}

		}
	}
}
