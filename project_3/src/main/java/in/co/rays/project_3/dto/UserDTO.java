package in.co.rays.project_3.dto;

import java.util.Date;

/**
 * User JavaDto encapsulates User attributes
 * @author Umesh Prajapati
 *
 */
public class UserDTO extends BaseDTO{
	
	public static final String active = "active";
	public static final String inactive="inactive";
	
	private String firstname;
	private String lastname;
	private String loginid;
	private String password;
	private String confirmpassword;
	
	
	private Date dob;
	private String mobileno;
	private long roleid;
	private String gender;
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public String getLoginid() {
		return loginid;
	}
	public void setLoginid(String loginid) {
		this.loginid = loginid;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getConfirmpassword() {
		return confirmpassword;
	}
	public void setConfirmpassword(String confirmpassword) {
		this.confirmpassword = confirmpassword;
	}
	public Date getDob() {
		return dob;
	}
	public void setDob(Date dob) {
		this.dob = dob;
	}
	public String getMobileno() {
		return mobileno;
	}
	public void setMobileno(String mobileno) {
		this.mobileno = mobileno;
	}
	public long getRoleid() {
		return roleid;
	}
	public void setRoleid(long roleid) {
		this.roleid = roleid;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public static String getActive() {
		return active;
	}
	public static String getInactive() {
		return inactive;
	}
	public String getKey() {
		// TODO Auto-generated method stub
		return id+ "";
	}
	public String getValue() {
		// TODO Auto-generated method stub
		return firstname+""+lastname;
	}
}
