package model.worksheet;

import java.util.Arrays;

import org.apache.commons.lang3.StringUtils;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import viewmodel.WorksheetViewModel;

import controller.UtilController;

public class WorksheetBackingFormValidator implements Validator {

  private Validator validator;
  private UtilController utilController;

  public WorksheetBackingFormValidator(Validator validator, UtilController utilController) {
    super();
    this.validator = validator;
    this.utilController = utilController;
  }

  @SuppressWarnings("unchecked")
  @Override
  public boolean supports(Class<?> clazz) {
    return Arrays.asList(WorksheetViewModel.class,
                         Worksheet.class,
                         WorksheetBackingForm.class,
                         FindWorksheetBackingForm.class).contains(clazz);
  }

  @Override
  public void validate(Object obj, Errors errors) {
    if (obj == null || validator == null)
      return;
    ValidationUtils.invokeValidator(validator, obj, errors);
    WorksheetBackingForm form = (WorksheetBackingForm) obj;
    updateAutoGeneratedFields(form);
    if (utilController.isDuplicateWorksheetNumber(form.getWorksheet()))
      errors.rejectValue("worksheet.worksheetNumber", "worksheetNumber.nonunique",
          "There exists a worksheet with the same worksheet number.");
    utilController.commonFieldChecks(form, "worksheet", errors);
  }

  private void updateAutoGeneratedFields(WorksheetBackingForm form) {
    if (StringUtils.isBlank(form.getWorksheetNumber()) &&
        utilController.isFieldAutoGenerated("worksheet", "worksheetNumber")) {
      form.setWorksheetNumber(utilController.getNextWorksheetNumber());
    }
  }

}
