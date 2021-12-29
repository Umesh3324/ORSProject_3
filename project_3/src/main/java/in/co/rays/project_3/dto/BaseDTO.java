package in.co.rays.project_3.dto;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 * This is Parent DTO class of All DTO class,
 * it contains Genric Attribute that are common in all DTO classes.
 * @author Umesh Prajapati
 *
 */
public abstract class BaseDTO implements Serializable,Comparable<BaseDTO>,DropdownList{

	protected long id;
	protected String createdby;
	protected String modifiedby;
	protected Timestamp createddatetime;
	protected Timestamp modifieddatetime;
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getCreatedby() {
		return createdby;
	}
	public void setCreatedby(String createdby) {
		this.createdby = createdby;
	}
	public String getModifiedby() {
		return modifiedby;
	}
	public void setModifiedby(String modifiedby) {
		this.modifiedby = modifiedby;
	}
	public Timestamp getCreateddatetime() {
		return createddatetime;
	}
	/*
	 * @param createddatetime
	 */
	public void setCreateddatetime(Timestamp createddatetime) {
		this.createddatetime = createddatetime;
	}
	public Timestamp getModifieddatetime() {
		return modifieddatetime;
	}
	public void setModifieddatetime(Timestamp modifieddatetime) {
		this.modifieddatetime = modifieddatetime;
	}
    public int compareTo(BaseDTO next){
		
		return getValue().compareTo(next.getValue());
		
	}
	
}
