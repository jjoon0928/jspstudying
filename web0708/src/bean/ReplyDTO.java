package bean;

public class ReplyDTO {
	String id;
	String oriid;
	String content;
	String writer;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getOriid() {
		return oriid;
	}
	public void setOriid(String oriid) {
		this.oriid = oriid;
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
	@Override
	public String toString() {
		return "ReplyDTO [id=" + id + ", oriid=" + oriid + ", content=" + content + ", writer=" + writer + "]";
	}
	
}
