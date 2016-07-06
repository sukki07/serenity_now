import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;

public class MiniQClient {
    
	public static void main (String[] args) throws IOException
	{   		
		MiniQClientConnection conn =  new MiniQClientConnection();
		String response = conn.send("hello");
		System.out.println(response);
	}

}
