package com.himedia.springboot;

public class QuestionDTO {

	int num;
	String title;
	String content;
	String writer;
	int hit;
	String created;
	String updated;
	/* String qusetion_img; */
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getCreated() {
		return created;
	}
	public void setCreated(String created) {
		this.created = created;
	}
	public String getUpdated() {
		return updated;
	}
	public void setUpdated(String updated) {
		this.updated = updated;
	}
//	public String getQusetion_img() {
//		return qusetion_img;
//	}
//	public void setQusetion_img(String qusetion_img) {
//		this.qusetion_img = qusetion_img;
//	}
	
}
