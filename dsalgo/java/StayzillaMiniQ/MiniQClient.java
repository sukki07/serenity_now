import java.io.IOException;

public class MiniQClient {
	public static void main (String[] args) throws IOException
	{   		
		MiniQClientConnection conn =  new MiniQClientConnection();
		String response = conn.send("hello");
		System.out.println(response);
	}

}
