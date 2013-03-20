package repository.bloodtyping;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import model.bloodtyping.BloodTypingTestResult;
import model.bloodtyping.rules.BloodTypingRule;
import model.collectedsample.CollectedSample;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class BloodTypingRuleEngine {

  @PersistenceContext
  private EntityManager em;

  public Map<String, Object> applyBloodTypingTests(CollectedSample collectedSample, Map<String, String> bloodTypingTestResults) {

    String queryStr = "SELECT r FROM BloodTypingRule r WHERE isActive=:isActive";
    TypedQuery<BloodTypingRule> query = em.createQuery(queryStr, BloodTypingRule.class);

    query.setParameter("isActive", true);
    List<BloodTypingRule> rules = query.getResultList();

    Map<String, String> storedTestResults = new HashMap<String, String>();

    for (BloodTypingTestResult t : collectedSample.getBloodTypingTestResults()) {
      storedTestResults.put(t.getId().toString(), t.getResult());
    }

    Map<String, String> availableTests = new HashMap<String, String>();
    availableTests.putAll(storedTestResults);
    for (String extraTestId : bloodTypingTestResults.keySet()) {
      // for rule comparison we are overwriting existing test results with new test results
      availableTests.put(extraTestId, bloodTypingTestResults.get(extraTestId));
    }

    Set<String> bloodAboChanges = new HashSet<String>();
    Set<String> bloodRhChanges = new HashSet<String>();
    Set<String> extraInformation = new HashSet<String>();
    List<String> pendingTestIds = new ArrayList<String>();

    for (BloodTypingRule rule : rules) {

      String pattern = rule.getPattern();
      boolean patternMatch = true;
      int indexInPattern = 0;

      List<String> missingTestIdsForRule = new ArrayList<String>();
      List<String> testIds = Arrays.asList(rule.getBloodTypingTestIds().split(","));

      String inputPattern = "";
      for (String testId : testIds) {
        indexInPattern = indexInPattern+1;
        String actualResult = availableTests.get(testId); 
        if (actualResult == null) {
          missingTestIdsForRule.add(testId);
          inputPattern += "?";
          patternMatch = false;
          continue;
        }
        String expectedResult = pattern.substring(indexInPattern-1,indexInPattern);
        inputPattern += actualResult;
        if (!expectedResult.equals(actualResult)) {
          patternMatch = false;
        }
      }

//      System.out.println();
      if (patternMatch) {
        System.out.println("Pattern matched for rule.");
//        System.out.println("test ids: " + rule.getBloodTypingTestIds() + ", " +
//        		               "pattern: " + rule.getPattern() + ", " +
//        		               "input pattern: " + inputPattern);
//        System.out.println("extra tests to be done: " + rule.getExtraTestsIds());
//        System.out.println("Changes to result: " +
//                            rule.getPart() + ", " + rule.getNewInformation() + ", " +
//                            rule.getExtraInformation() + ", " + rule.getMarkSampleAsUnsafe());
//
        switch (rule.getPart()) {
          case BLOODABO:
            bloodAboChanges.add(rule.getNewInformation());
            break;
          case BLOODRH:
            bloodRhChanges.add(rule.getNewInformation());
            break;
          case EXTRA:
            extraInformation.add(rule.getNewInformation());
            break;
        }

        if (StringUtils.isNotBlank(rule.getExtraInformation())) 
          extraInformation.add(rule.getExtraInformation());

        if (StringUtils.isNotBlank(rule.getExtraTestsIds())) {
          for (String extraTestId : rule.getExtraTestsIds().split(",")) {
            if (!availableTests.containsKey(extraTestId)) {
              pendingTestIds.add(extraTestId);
            }
          }
        }

      } else {
//        System.out.println("Pattern did not match");
//        System.out.println("test ids: " + rule.getBloodTypingTestIds() + ", " +
//            "pattern: " + rule.getPattern() + ", " +
//            "input pattern: " + inputPattern);
//        System.out.println("Missing tests: " + missingTestIdsForRule);
      }
    }

    BloodTypingStatus status = BloodTypingStatus.INCOMPLETE_INFORMATION;
    if (bloodAboChanges.size() > 1 || bloodRhChanges.size() > 1) {
      status = BloodTypingStatus.AMBIGUOUS;
    }
    if (bloodAboChanges.isEmpty() || bloodRhChanges.isEmpty()) {
      if (pendingTestIds.size() > 0)
        status = BloodTypingStatus.PENDING_TESTS;
    }
    if (bloodAboChanges.size() == 1 && bloodRhChanges.size() == 1) {
      status = BloodTypingStatus.COMPLETE;
    }

    Map<String, Object> result = new HashMap<String, Object>();
    result.put("bloodAbo", bloodAboChanges);
    result.put("bloodRh", bloodRhChanges);
    result.put("extra", extraInformation);
    result.put("pendingTests", pendingTestIds);
    result.put("testResults", availableTests);
    result.put("bloodTypingStatus", status);
    result.put("storedTestResults", storedTestResults);
    return result;
  }

}