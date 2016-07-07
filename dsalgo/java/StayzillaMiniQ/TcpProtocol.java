import java.util.HashMap;
import java.io.IOException;
public interface TcpProtocol
{
	public void processSocketOutput(MiniQApplicationApi applicationResponseObject);
	public MiniQApplicationApi processSocketInput() throws IOException ; 
}
