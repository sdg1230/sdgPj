package question.model.vo;

public class Question {
	private int questionNo;
	private String questionWriter;
	private String questionContent;
	private String questionFilename;
	private String questionFilepath;
	private int questionRef;
	public Question() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Question(int questionNo, String questionWriter, String questionContent, String questionFilename,
			String questionFilepath, int questionRef) {
		super();
		this.questionNo = questionNo;
		this.questionWriter = questionWriter;
		this.questionContent = questionContent;
		this.questionFilename = questionFilename;
		this.questionFilepath = questionFilepath;
		this.questionRef = questionRef;
	}
	public int getQuestionNo() {
		return questionNo;
	}
	public void setQuestionNo(int questionNo) {
		this.questionNo = questionNo;
	}
	public String getQuestionWriter() {
		return questionWriter;
	}
	public void setQuestionWriter(String questionWriter) {
		this.questionWriter = questionWriter;
	}
	public String getQuestionContent() {
		return questionContent;
	}
	public void setQuestionContent(String questionContent) {
		this.questionContent = questionContent;
	}
	public String getQuestionFilename() {
		return questionFilename;
	}
	public void setQuestionFilename(String questionFilename) {
		this.questionFilename = questionFilename;
	}
	public String getQuestionFilepath() {
		return questionFilepath;
	}
	public void setQuestionFilepath(String questionFilepath) {
		this.questionFilepath = questionFilepath;
	}
	public int getQuestionRef() {
		return questionRef;
	}
	public void setQuestionRef(int questionRef) {
		this.questionRef = questionRef;
	}
	
	
}
