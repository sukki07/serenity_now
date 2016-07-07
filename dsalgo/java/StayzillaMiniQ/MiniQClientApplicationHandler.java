import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.BufferedReader;
import java.net.Socket;
import java.util.HashMap;


public class MiniQClientApplicationHandler implements Runnable {
	private TcpProtocol transportProtocol;
	public  MiniQClientApplicationHandler(TcpProtocol transportProtocol) {
		this.transportProtocol = transportProtocol;
	}

	public void run() 
	{
		try {
			MiniQAdmin admin = MiniQAdmin.getInstance();
			ApplicationRequest applicationRequestObject = transportProtocol.processSocketInput();
			ApplicationResponse applicationResponseObject  = admin.getResponseObjectForRequestObject(applicationRequestObject);
			transportProtocol.processSocketOutput(applicationResponseObject);
		} catch (IOException e) {

		}
	}
}
