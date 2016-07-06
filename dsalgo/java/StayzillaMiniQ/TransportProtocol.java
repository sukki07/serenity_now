import java.util.HashMap;
import java.io.IOException;
public interface TransportProtocol
{
	public HashMap<String,String> processInputStreamAtServer() throws IOException;
	public  processOutputStreamAtServer() throws IOException;
	public HashMap<String,String> processInputStreamAtClient() throws IOException;
	public HashMap<String,String> processOutputStreamAtClient() throws IOException;
	public void processOutputStream(HashMap<String,String> responseMap) throws IOException;
}
