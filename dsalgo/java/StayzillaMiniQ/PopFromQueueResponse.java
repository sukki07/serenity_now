public class PopFromQueueResponse extends ApplicationResponse
{
	private ClientMessage msg;
	public void setClientMessage(ClientMessage msg)
	{
		this.msg = msg;
	}
	public ClientMessage getClientMessage()
	{
		return msg;
	}


}
