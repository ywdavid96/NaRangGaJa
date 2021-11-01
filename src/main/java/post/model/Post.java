package post.model;

public class Post {
	
	Long Post_ID;
	String Customer_ID;
	String Guide_ID;
	String fileName;
	String fileRealName;
	String Text; //텍스트
	
	public Long getPost_ID() {
		return Post_ID;
	}
	public void setPost_ID(Long post_ID) {
		Post_ID = post_ID;
	}
	public String getCustomer_ID() {
		return Customer_ID;
	}
	public void setCustomer_ID(String customer_ID) {
		Customer_ID = customer_ID;
	}
	public String getGuide_ID() {
		return Guide_ID;
	}
	public void setGuide_ID(String guide_ID) {
		Guide_ID = guide_ID;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFileRealName() {
		return fileRealName;
	}
	public void setFileRealName(String fileRealName) {
		this.fileRealName = fileRealName;
	}
	public String getText() {
		return Text;
	}
	public void setText(String text) {
		Text = text;
	}

	
	
	

}
