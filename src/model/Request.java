package model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.hibernate.annotations.Type;

@Entity
public class Request {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long requestId;
	private String requestNumber;
	private Date dateRequested;
	private Date dateRequired;
	private Long siteId;
	private String productType;
	private String abo;
	private String rhd;
	private Integer quantity;
	private String status;
	private String patientName;
	private String comments;

	@Type(type = "org.hibernate.type.NumericBooleanType")
	private Boolean isDeleted;

	public Request() {
	}

	public Request(String requestNumber, Date dateRequested, Date dateRequired,
			Long siteId, String productType, String abo, String rhd,
			Integer quantity, String status, String patientName, Boolean deleted, String comments) {
		this.requestNumber = requestNumber;
		this.dateRequested = dateRequested;
		this.dateRequired = dateRequired;
		this.siteId = siteId;
		this.productType = productType;
		this.abo = abo;
		this.rhd = rhd;
		this.quantity = quantity;
		this.patientName = patientName;
		this.comments = comments;
		this.status = status;
		isDeleted = deleted;
	}

	public void copy(Request request) {
		this.requestNumber = request.requestNumber;
		this.dateRequested = request.dateRequested;
		this.dateRequired = request.dateRequired;
		this.siteId = request.siteId;
		this.productType = request.productType;
		this.abo = request.abo;
		this.rhd = request.rhd;
		this.quantity = request.quantity;
		this.comments = request.comments;
		this.patientName = request.patientName;
		this.status = request.status;
		isDeleted = request.isDeleted;
	}

	public void setRequestNumber(String requestNumber) {
		this.requestNumber = requestNumber;
	}

	public void setDateRequested(Date dateRequested) {
		this.dateRequested = dateRequested;
	}

	public void setDateRequired(Date dateRequired) {
		this.dateRequired = dateRequired;
	}

	public void setSiteId(Long siteId) {
		this.siteId = siteId;
	}

	public void setProductType(String productType) {
		this.productType = productType;
	}

	public void setAbo(String abo) {
		this.abo = abo;
	}

	public void setRhd(String rhd) {
		this.rhd = rhd;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public void setIsDeleted(Boolean isDeleted) {
		this.isDeleted = isDeleted;
	}

	public Long getRequestId() {
		return requestId;
	}

	public String getRequestNumber() {
		return requestNumber;
	}

	public Date getDateRequested() {
		return dateRequested;
	}

	public Date getDateRequired() {
		return dateRequired;
	}

	public Long getSiteId() {
		return siteId;
	}

	public String getProductType() {
		return productType;
	}

	public String getAbo() {
		return abo;
	}

	public String getRhd() {
		return rhd;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public String getComments() {
		return comments;
	}

	public String getStatus() {
		return status;
	}

	public String getPatientName() {
	  return patientName;
	}

	public void setPatientName(String patientName) {
	  this.patientName = patientName;
	}
	
	public Boolean getDeleted() {
		return isDeleted;
	}
}
