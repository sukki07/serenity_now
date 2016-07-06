import java.util.HashMap;
import java.io.IOException;
public interface TcpProtocol
{
	public void processSocketOutput(ApplicationObject applicationResponseObject);
	public ApplicationObject processSocketInput(); throws IOException

}
