package model.compatibility;

import java.text.ParseException;
import java.util.Date;

import javax.validation.Valid;

import model.CustomDateFormatter;
import model.product.Product;
import model.request.Request;
import model.user.User;

public class CompatibilityTestBackingForm {

  @Valid
  private CompatibilityTest compatibilityTest;

  private String compatiblityTestDate;

  public CompatibilityTestBackingForm() {
    compatibilityTest = new CompatibilityTest();
  }

  public Date getLastUpdated() {
    return compatibilityTest.getLastUpdated();
  }

  public Date getCreatedDate() {
    return compatibilityTest.getCreatedDate();
  }

  public User getCreatedBy() {
    return compatibilityTest.getCreatedBy();
  }

  public User getLastUpdatedBy() {
    return compatibilityTest.getLastUpdatedBy();
  }

  public void setLastUpdated(Date lastUpdated) {
    compatibilityTest.setLastUpdated(lastUpdated);
  }

  public void setCreatedDate(Date createdDate) {
    compatibilityTest.setCreatedDate(createdDate);
  }

  public void setCreatedBy(User createdBy) {
    compatibilityTest.setCreatedBy(createdBy);
  }

  public void setLastUpdatedBy(User lastUpdatedBy) {
    compatibilityTest.setLastUpdatedBy(lastUpdatedBy);
  }

  public Long getId() {
    return compatibilityTest.getId();
  }

  public void setId(Long id) {
    compatibilityTest.setId(id);
  }

  public Request getForRequest() {
    return compatibilityTest.getForRequest();
  }

  public void setForRequest(Request forRequest) {
    compatibilityTest.setForRequest(forRequest);
  }

  public String getProductNumber() {
    if (compatibilityTest == null || compatibilityTest.getTestedProduct() == null ||
        compatibilityTest.getTestedProduct().getProductNumber() == null
       )
      return "";
    return compatibilityTest.getTestedProduct().getProductNumber();
  }

  public void setProductNumber(String productNumber) {
    Product product = new Product();
    product.setProductNumber(productNumber);
    compatibilityTest.setTestedProduct(product);
  }

  public String getRequestNumber() {
    if (compatibilityTest == null || compatibilityTest.getForRequest() == null ||
        compatibilityTest.getForRequest().getRequestNumber() == null
       )
      return "";
    return compatibilityTest.getForRequest().getRequestNumber();
  }

  public void setRequestNumber(String requestNumber) {
    Request request = new Request();
    request.setRequestNumber(requestNumber);
    compatibilityTest.setForRequest(request);
  }

  public Product getTestedProduct() {
    return compatibilityTest.getTestedProduct();
  }

  public void setTestedProduct(Product testedProduct) {
    compatibilityTest.setTestedProduct(testedProduct);
  }

  public Boolean getTransfusedBefore() {
    return compatibilityTest.getTransfusedBefore();
  }

  public void setTransfusedBefore(Boolean transfusedBefore) {
    compatibilityTest.setTransfusedBefore(transfusedBefore);
  }

  public String getCompatibilityResult() {
    if (compatibilityTest.getCompatibilityResult() == null)
      return "";
    else
      return compatibilityTest.getCompatibilityResult().toString();
  }

  public void setCompatibilityResult(String compatibilityResult) {
    compatibilityTest.setCompatibilityResult(CompatibilityResult.lookup(compatibilityResult));
  }

  public String getCrossmatchType() {
    CrossmatchType crossmatchType = compatibilityTest.getCrossmatchType();
    if (crossmatchType == null)
      return "";
    else
      return crossmatchType.getId().toString();
  }

  public void setCrossmatchType(String crossmatchTypeId) {
    if (crossmatchTypeId == null) {
      compatibilityTest.setCrossmatchType(null);
    }
    else {
      CrossmatchType ct = new CrossmatchType();
      ct.setId(Integer.parseInt(crossmatchTypeId));
      compatibilityTest.setCrossmatchType(ct);
    }
  }

  public String getTestedBy() {
    return compatibilityTest.getTestedBy();
  }

  public String getCompatibilityTestDate() {
    if (compatiblityTestDate != null)
      return compatiblityTestDate;
    if (compatibilityTest == null)
      return "";
    return CustomDateFormatter.getDateTimeString(compatibilityTest.getCompatibilityTestDate());
  }

  public void setTestedBy(String testedBy) {
    compatibilityTest.setTestedBy(testedBy);
  }

  public void setCompatibilityTestDate(String compatibilityTestDate) {
    this.compatiblityTestDate = compatibilityTestDate;
    try {
      compatibilityTest.setCompatibilityTestDate(CustomDateFormatter.getDateTimeFromString(compatibilityTestDate));
    } catch (ParseException ex) {
      ex.printStackTrace();
      compatibilityTest.setCompatibilityTestDate(null);
    }
  }

  public String getNotes() {
    return compatibilityTest.getNotes();
  }

  public void setNotes(String notes) {
    compatibilityTest.setNotes(notes);
  }

  public CompatibilityTest getCompatibilityTest() {
    return compatibilityTest;
  }

  public void setCompatibilityTest(CompatibilityTest crossmatchTest) {
    this.compatibilityTest = crossmatchTest;
  }
}