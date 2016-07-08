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
		String threadName = Thread.currentThread().getName();
		System.out.println(String.format("-----RequestBegin----%s",threadName));
		MiniQAdmin admin = MiniQAdmin.getInstance();
		MiniQApplicationApi applicationRequestObject = transportProtocol.processSocketInput();
		MiniQApplicationApi applicationResponseObject  = admin.getResponseObjectForRequestObject((ApplicationRequest)applicationRequestObject);
		transportProtocol.processSocketOutput(applicationResponseObject);
		System.out.println(String.format("-----RequestEnd----%s",threadName));
	}

}
