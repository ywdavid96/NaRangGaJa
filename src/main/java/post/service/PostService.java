package post.service;

import post.dao.PostDAO;

public class PostService {

	
	private static PostService service = new PostService();
	public PostDAO dao = PostDAO.getInstance();
	private PostService() {}
	
	public static PostService getInstance() {
		return service;
	}
	
	public void newPost(String userId, String type, String fileName,String fileRealName,String text) {
		dao.newPost(userId, type, fileName, fileRealName, text);
	}
	
}
