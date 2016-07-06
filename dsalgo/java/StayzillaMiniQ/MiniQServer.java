import java.net.ServerSocket;
import java.net.Socket;

public class MiniQServer {
	private HashMap<String,MiniQ> mapForAllAvailableQueues;
	private initializeMapForAllAvailableQueue()
	{
		this.mapForAllAvailableQueues = new HashMap();
	}

	public MiniQServer(){
		initializeMapForAllAvailableQueue()
	}

	public static void main(String[] args) throws Exception {
		ServerSocket listener = new ServerSocket(9898);
		try {
			while (true) {
				Socket clientSocket = listener.accept();
				MiniQClientHandler miniQClientHandler = new MiniQClientHandler(clientSocket);
				Thread clientThread = new Thread(miniQClientHandler);
				clientThread.start();               

			}
		} finally {
			listener.close();
		}
	}
}
