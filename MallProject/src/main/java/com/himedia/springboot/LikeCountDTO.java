package com.himedia.springboot;

public class LikeCountDTO {
	  private String title;
	  private int count;
	  private String userId;
	  private String imgstate;
	  private int countlike; 
	  private int num;
		
		
	    public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
		public int getCountlike() {
		return countlike;
	}
	public void setCountlike(int countlike) {
		this.countlike = countlike;
	}
		public String getImgstate() {
		return imgstate;
	}
	public void setImgstate(String imgstate) {
		this.imgstate = imgstate;
	}
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public int getCount() {
			return count;
		}
		public void setCount(int count) {
			this.count = count;
		}
		public String getUserId() {
			return userId;
		}
		public void setUserId(String userId) {
			this.userId = userId;
		}
	
}
