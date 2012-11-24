package repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import model.admin.FormField;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class FormFieldRepository {
  @PersistenceContext
  private EntityManager em;

  public void saveFormField(FormField formField) {
    em.persist(formField);
    em.flush();
  }

  public FormField findFormFieldById(Long formFieldId) {
    try {
      String queryString = "SELECT f FROM FormField f WHERE f.id = :formFieldId";
      TypedQuery<FormField> query = em.createQuery(queryString, FormField.class);
      return query.setParameter("formFieldId", formFieldId).getSingleResult();
    } catch (NoResultException ex) {
      ex.printStackTrace();
      return null;
    }
  }

  public List<FormField> allFormFields() {
    try {
      String queryString = "SELECT f FROM FormField f";
      TypedQuery<FormField> query = em.createQuery(queryString, FormField.class);
      return query.getResultList();
    } catch (NoResultException ex) {
      ex.printStackTrace();
      return null;
    }
  }

  public FormField updateFormField(FormField formField) {
    FormField existingFormField = findFormFieldById(formField.getId());
    if (existingFormField == null) {
      return null;
    }
    existingFormField.copy(formField);
    em.merge(existingFormField);
    em.flush();
    return existingFormField;
  }
}