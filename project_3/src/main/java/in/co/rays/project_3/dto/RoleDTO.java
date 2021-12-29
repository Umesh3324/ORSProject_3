package in.co.rays.project_3.dto;

/**
 * @author Umesh Prajapati
 *
 */
public class RoleDTO extends BaseDTO{
	public static final int ADMIN = 1;
	public static final int STUDENT = 3;
	public static final int FACULTY = 5;
	public static final int KIOSK = 4;
	public static final int COLLEGE = 2;
	private String name;
	private String description;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public static int getAdmin() {
		return ADMIN;
	}
	public static int getStudent() {
		return STUDENT;
	}
	public static int getFaculty() {
		return FACULTY;
	}
	public static int getKiosk() {
		return KIOSK;
	}
	public static int getCollege() {
		return COLLEGE;
	}
	public String getKey() {
		return id+"";
	}
	public String getValue() {
		return name;
	}
}
