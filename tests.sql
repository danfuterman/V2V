insert into GenericConfig (propertyName, propertyValue, propertyOwner) values
("bloodTypingContext", "RECORD_BLOOD_TYPING_TESTS", "labsetup"),
("useElisaPlates", "true", "labsetup"),
("useWorksheets", "true", "labsetup");

insert into MicrotiterPlate (id, plateKey, plateName, numRows, numColumns, notes, isDeleted) values
(1, 'bloodtyping', 'Blood Typing Plate', 8, 12, '', '0'),
(2, 'tti', 'Elisa Plate', 8, 12, '', '0');

insert into BloodTest
(id, testNameShort, testName,
validResults, negativeResults, positiveResults,
rankInCategory, bloodTestType, category,
context,
isEmptyAllowed, isActive) values
(1, 'Anti-A', 'Anti-A',
'+,-', '-', '+',
'1', 'BASIC_BLOODTYPING', 'BLOODTYPING',
'RECORD_BLOOD_TYPING_TESTS',
'0', '1'),
(2, 'Anti-B', 'Anti-B',
'+,-', '-', '+',
'2', 'BASIC_BLOODTYPING', 'BLOODTYPING',
'RECORD_BLOOD_TYPING_TESTS',
'0', '1'),
(3, 'Anti-A,B', 'Anti-A,B',
'+,-', '-', '+',
'3', 'BASIC_BLOODTYPING', 'BLOODTYPING',
'RECORD_BLOOD_TYPING_TESTS',
'0', '1'),
(4, 'A1 Cells', 'A1 Cells',
'+,-', '-', '+',
'4', 'BASIC_BLOODTYPING', 'BLOODTYPING',
'RECORD_BLOOD_TYPING_TESTS',
'0', '1'),
(5, 'B Cells', 'B Cells',
'+,-', '-', '+',
'5', 'BASIC_BLOODTYPING', 'BLOODTYPING',
'RECORD_BLOOD_TYPING_TESTS',
'0', '1'),
(6, 'Anti-D', 'Anti-D',
'+,-', '-', '+',
'6', 'BASIC_BLOODTYPING', 'BLOODTYPING',
'RECORD_BLOOD_TYPING_TESTS',
'0', '1'),
(7, 'AbScr', 'Antibody Screen',
'+,-', '-', '+',
'7', 'BASIC_BLOODTYPING', 'BLOODTYPING',
'RECORD_BLOOD_TYPING_TESTS',
'0', '1'),
(8, 'Haemolysin', 'Haemolysin',
'+,-', '-', '+',
'8', 'BASIC_BLOODTYPING', 'BLOODTYPING',
'RECORD_BLOOD_TYPING_TESTS',
'0', '1'),
(9, 'Du', 'Du',
'+,-', '-', '+',
'1', 'ADVANCED_BLOODTYPING', 'BLOODTYPING',
'RECORD_BLOOD_TYPING_TESTS',
'0', '1'),
(10, 'AHG Control (Du)', 'AHG Control (Du)',
'+,-', '-', '+',
'1', 'ADVANCED_BLOODTYPING', 'BLOODTYPING',
'RECORD_BLOOD_TYPING_TESTS',
'0', '1'),
(11, 'DAT if Du Pos', 'DAT if Du Pos',
'+,-', '-', '+',
'1', 'ADVANCED_BLOODTYPING', 'BLOODTYPING',
'RECORD_BLOOD_TYPING_TESTS',
'0', '1'),
(12, 'AHG Control (DAT)', 'AHG Control (DAT)',
'+,-', '-', '+',
'1', 'ADVANCED_BLOODTYPING', 'BLOODTYPING',
'RECORD_BLOOD_TYPING_TESTS',
'0', '1'),
(13, 'Immune anti-A', 'Immune anti-A',
'+,-', '-', '+',
'1', 'ADVANCED_BLOODTYPING', 'BLOODTYPING',
'RECORD_BLOOD_TYPING_TESTS',
'0', '1');

insert into BloodTestingRule
(bloodTestsIds, pattern,
 collectionFieldChanged, newInformation, extraInformation,
 context, category, subCategory,
 pendingTestsIds, markSampleAsUnsafe, isActive
) values
('1,2,3,4,5', '-,-,-,+,+',
 'BLOODABO', 'O', '',
 'RECORD_BLOOD_TYPING_TESTS', 'BLOODTYPING', 'BLOODABO',
 '', '0', '1'
 ),
('1,2,3,4,5', '+,-,+,-,+',
 'BLOODABO', 'A', '',
 'RECORD_BLOOD_TYPING_TESTS', 'BLOODTYPING', 'BLOODABO',
 '', '0', '1'
 ),
('1,2,3,4,5', '-,+,+,+,-',
 'BLOODABO', 'B', '',
 'RECORD_BLOOD_TYPING_TESTS', 'BLOODTYPING', 'BLOODABO',
 '', '0', '1'
 ),
('1,2,3,4,5', '+,+,+,-,-',
 'BLOODABO', 'AB', '',
 'RECORD_BLOOD_TYPING_TESTS', 'BLOODTYPING', 'BLOODABO',
 '', '0', '1'
 ),
('6', '+',
 'BLOODRH', '+', '',
 'RECORD_BLOOD_TYPING_TESTS', 'BLOODTYPING', 'BLOODRH',
 '', '0', '1'
 ),
('6', '-',
 'NOCHANGE', '', '',
 'RECORD_BLOOD_TYPING_TESTS', 'BLOODTYPING', 'BLOODRH',
 '9,10', '0', '1'
 ),
('6,9,10', '-,-,+',
 'BLOODRH', '-', '',
 'RECORD_BLOOD_TYPING_TESTS', 'BLOODTYPING', 'BLOODRH',
 '', '0', '1'
 ),
('6,9,10', '-,+,-',
 'BLOODRH', '+', '',
 'RECORD_BLOOD_TYPING_TESTS', 'BLOODTYPING', 'BLOODRH',
 '', '0', '1'
 ),
 ('6,9,11', '-,+,+',
 'EXTRA', 'DAT Pos', '',
 'RECORD_BLOOD_TYPING_TESTS', 'BLOODTYPING', 'BLOODRH',
 '', '0', '1'
 ),
 ('6,9,11', '-,+,-',
 'EXTRA', 'DAT Neg', '',
 'RECORD_BLOOD_TYPING_TESTS', 'BLOODTYPING', 'BLOODRH',
 '', '0', '1'
 ),
 ('1,2,3,4,5', '-,-,+,-,+',
 'NOCHANGE', '', '',
 'RECORD_BLOOD_TYPING_TESTS', 'BLOODTYPING', 'BLOODABO',
 '13', '0', '1'
 ),
 ('1,2,3,4,5,13', '-,-,+,-,+,+',
 'BLOODABO', 'A', 'wkA',
 'RECORD_BLOOD_TYPING_TESTS', 'BLOODTYPING', 'BLOODABO',
 '', '0', '1'
 ),
 ('1,2,3,4,5', '-,+,+,-,-',
 'NOCHANGE', '', '',
 'RECORD_BLOOD_TYPING_TESTS', 'BLOODTYPING', 'BLOODABO',
 '13', '0', '1'
 ),
 ('1,2,3,4,5,13', '-,+,+,-,-,+',
 'BLOODABO', 'AB', 'wkAB',
 'RECORD_BLOOD_TYPING_TESTS', 'BLOODTYPING', 'BLOODABO',
 '', '0', '1'
 );

 insert into BloodTest
(id, testNameShort, testName,
validResults, negativeResults, positiveResults,
rankInCategory, bloodTestType, category,
context,
isEmptyAllowed, isActive) values
(17, 'HIV', 'HIV',
'+,-', '-', '+',
'1', 'BASIC_TTI', 'TTI',
'RECORD_TTI_TESTS',
'0', '1'),
(18, 'HIV Conf 1', 'HIV Confirmatory 1',
'+,-', '-', '+',
'1', 'CONFIRMATORY_TTI', 'TTI',
'RECORD_TTI_TESTS',
'0', '1'),
(19, 'HIV Conf 2', 'HIV Confirmatory 2',
'+,-', '-', '+',
'1', 'CONFIRMATORY_TTI', 'TTI',
'RECORD_TTI_TESTS',
'0', '1'),
(20, 'HBV', 'HBV',
'+,-', '-', '+',
'1', 'BASIC_TTI', 'TTI',
'RECORD_TTI_TESTS',
'0', '1'),
(21, 'HBV Conf 1', 'HBV Confirmatory 1',
'+,-', '-', '+',
'1', 'CONFIRMATORY_TTI', 'TTI',
'RECORD_TTI_TESTS',
'0', '1'),
(22, 'HBV Conf 2', 'HBV Confirmatory 2',
'+,-', '-', '+',
'1', 'CONFIRMATORY_TTI', 'TTI',
'RECORD_TTI_TESTS',
'0', '1'),
(23, 'HCV', 'HCV',
'+,-', '-', '+',
'1', 'BASIC_TTI', 'TTI',
'RECORD_TTI_TESTS',
'0', '1'),
(24, 'HCV Conf 1', 'HCV Confirmatory 1',
'+,-', '-', '+',
'1', 'CONFIRMATORY_TTI', 'TTI',
'RECORD_TTI_TESTS',
'0', '1'),
(25, 'HCV Conf 2', 'HCV Confirmatory 2',
'+,-', '-', '+',
'1', 'CONFIRMATORY_TTI', 'TTI',
'RECORD_TTI_TESTS',
'0', '1'),
(26, 'Syphilis', 'Syphilis',
'+,-', '-', '+',
'1', 'BASIC_TTI', 'TTI',
'RECORD_TTI_TESTS',
'0', '1'),
(27, 'Syphilis Conf 1', 'Syphilis Confirmatory 1',
'+,-', '-', '+',
'1', 'CONFIRMATORY_TTI', 'TTI',
'RECORD_TTI_TESTS',
'0', '1'),
(28, 'Syphilis Conf 2', 'Syphilis Confirmatory 2',
'+,-', '-', '+',
'1', 'CONFIRMATORY_TTI', 'TTI',
'RECORD_TTI_TESTS',
'0', '1');

insert into BloodTestingRule
(bloodTestsIds, pattern,
 collectionFieldChanged, newInformation, extraInformation,
 context, category, subCategory,
 pendingTestsIds, markSampleAsUnsafe, isActive
) values
('17,20,23,26', '-,-,-,-',
 'TTISTATUS', 'TTI_SAFE', '',
 'RECORD_TTI_TESTS', 'TTI', 'TTI',
 '', '0', '1'
 ),
('17', '+',
 'TTISTATUS', 'TTI_UNSAFE', '',
 'RECORD_TTI_TESTS', 'TTI', 'TTI',
 '18,19', '0', '1'
 ),
 ('17,18,19', '-,+,-',
 'TTISTATUS', 'TTI_UNSAFE', '',
 'RECORD_TTI_TESTS', 'TTI', 'TTI',
 '', '0', '1'
 ),
 ('17,18,19', '-,-,+',
 'TTISTATUS', 'TTI_UNSAFE', '',
 'RECORD_TTI_TESTS', 'TTI', 'TTI',
 '', '0', '1'
 ),
 ('17,18,19', '+,-,-',
 'TTISTATUS', 'TTI_UNSAFE', '',
 'RECORD_TTI_TESTS', 'TTI', 'TTI',
 '', '0', '1'
 ),
 ('17,18,19', '+,+,-',
 'TTISTATUS', 'TTI_UNSAFE', '',
 'RECORD_TTI_TESTS', 'TTI', 'TTI',
 '', '0', '1'
 ),
 ('17,18,19', '-,+,+',
 'TTISTATUS', 'TTI_UNSAFE', '',
 'RECORD_TTI_TESTS', 'TTI', 'TTI',
 '', '0', '1'
 ),
 ('17,18,19', '+,-,+',
 'TTISTATUS', 'TTI_UNSAFE', '',
 'RECORD_TTI_TESTS', 'TTI', 'TTI',
 '', '0', '1'
 ),
 ('17,18,19', '-,-,-',
 'TTISTATUS', 'TTI_SAFE', '',
 'RECORD_TTI_TESTS', 'TTI', 'TTI',
 '', '0', '1'
 ),
('20', '+',
 'TTISTATUS', 'TTI_UNSAFE', '',
 'RECORD_TTI_TESTS', 'TTI', 'TTI',
 '21,22', '0', '1'
 ),
 ('20,21,22', '-,+,-',
 'TTISTATUS', 'TTI_UNSAFE', '',
 'RECORD_TTI_TESTS', 'TTI', 'TTI',
 '', '0', '1'
 ),
 ('20,21,22', '-,-,+',
 'TTISTATUS', 'TTI_UNSAFE', '',
 'RECORD_TTI_TESTS', 'TTI', 'TTI',
 '', '0', '1'
 ),
 ('20,21,22', '+,-,-',
 'TTISTATUS', 'TTI_UNSAFE', '',
 'RECORD_TTI_TESTS', 'TTI', 'TTI',
 '', '0', '1'
 ),
 ('20,21,22', '+,+,-',
 'TTISTATUS', 'TTI_UNSAFE', '',
 'RECORD_TTI_TESTS', 'TTI', 'TTI',
 '', '0', '1'
 ),
 ('20,21,22', '-,+,+',
 'TTISTATUS', 'TTI_UNSAFE', '',
 'RECORD_TTI_TESTS', 'TTI', 'TTI',
 '', '0', '1'
 ),
 ('20,21,22', '+,-,+',
 'TTISTATUS', 'TTI_UNSAFE', '',
 'RECORD_TTI_TESTS', 'TTI', 'TTI',
 '', '0', '1'
 ),
('23', '+',
 'TTISTATUS', 'TTI_UNSAFE', '',
 'RECORD_TTI_TESTS', 'TTI', 'TTI',
 '24,25', '0', '1'
 ),
 ('23,24,25', '-,+,-',
 'TTISTATUS', 'TTI_UNSAFE', '',
 'RECORD_TTI_TESTS', 'TTI', 'TTI',
 '', '0', '1'
 ),
 ('23,24,25', '-,-,+',
 'TTISTATUS', 'TTI_UNSAFE', '',
 'RECORD_TTI_TESTS', 'TTI', 'TTI',
 '', '0', '1'
 ),
 ('23,24,25', '+,-,-',
 'TTISTATUS', 'TTI_UNSAFE', '',
 'RECORD_TTI_TESTS', 'TTI', 'TTI',
 '', '0', '1'
 ),
 ('23,24,25', '+,+,-',
 'TTISTATUS', 'TTI_UNSAFE', '',
 'RECORD_TTI_TESTS', 'TTI', 'TTI',
 '', '0', '1'
 ),
 ('23,24,25', '-,+,+',
 'TTISTATUS', 'TTI_UNSAFE', '',
 'RECORD_TTI_TESTS', 'TTI', 'TTI',
 '', '0', '1'
 ),
 ('23,24,25', '+,-,+',
 'TTISTATUS', 'TTI_UNSAFE', '',
 'RECORD_TTI_TESTS', 'TTI', 'TTI',
 '', '0', '1'
 ),
('26', '+',
 'TTISTATUS', 'TTI_UNSAFE', '',
 'RECORD_TTI_TESTS', 'TTI', 'TTI',
 '27,28', '0', '1'
 ),
 ('26,27,28', '-,+,-',
 'TTISTATUS', 'TTI_UNSAFE', '',
 'RECORD_TTI_TESTS', 'TTI', 'TTI',
 '', '0', '1'
 ),
 ('26,27,28', '-,-,+',
 'TTISTATUS', 'TTI_UNSAFE', '',
 'RECORD_TTI_TESTS', 'TTI', 'TTI',
 '', '0', '1'
 ),
 ('26,27,28', '+,-,-',
 'TTISTATUS', 'TTI_UNSAFE', '',
 'RECORD_TTI_TESTS', 'TTI', 'TTI',
 '', '0', '1'
 ),
 ('26,27,28', '+,+,-',
 'TTISTATUS', 'TTI_UNSAFE', '',
 'RECORD_TTI_TESTS', 'TTI', 'TTI',
 '', '0', '1'
 ),
 ('26,27,28', '-,+,+',
 'TTISTATUS', 'TTI_UNSAFE', '',
 'RECORD_TTI_TESTS', 'TTI', 'TTI',
 '', '0', '1'
 ),
 ('26,27,28', '+,-,+',
 'TTISTATUS', 'TTI_UNSAFE', '',
 'RECORD_TTI_TESTS', 'TTI', 'TTI',
 '', '0', '1'
 ),
 ('17,18,19,20,21,22,23,24,25,26,27,28', '-,-,-,-,-,-,-,-,-,-,-,-',
 'TTISTATUS', 'TTI_SAFE', '',
 'RECORD_TTI_TESTS', 'TTI', 'TTI',
 '', '0', '1'
 );

insert into Tips(tipsKey, tipsName, tipsContent) values
('bloodtyping.plate.step1', 'Step 1 of Blood Typing', 'Scan/type collection numbers for all columns on microtiter plate');

insert into GenericConfig (propertyName, propertyValue, propertyOwner) values
("horizontalentry", "true", "bloodtyping"),
("titerWellRadius", "25", "bloodTyping");

insert into GenericConfig (propertyName, propertyValue, propertyOwner) values
("horizontalentry", "true", "ttiWells"),
("titerWellRadius", "25", "ttiWells");

insert into BloodTest
(id, testNameShort, testName,
validResults, negativeResults, positiveResults,
rankInCategory, bloodTestType, category,
context,
isEmptyAllowed, isActive) values
(29, 'Blood ABO', 'Blood ABO',
'A,B,AB,O', '', '',
'1', 'BASIC_BLOODTYPING', 'BLOODTYPING',
'RECORD_BLOOD_TYPING_OUTCOMES',
'0', '0'),
(30, 'Blood Rh', 'Blood Rh',
'+,-', '', '',
'1', 'BASIC_BLOODTYPING', 'BLOODTYPING',
'RECORD_BLOOD_TYPING_OUTCOMES',
'0', '0');

insert into BloodTestingRule
(bloodTestsIds, pattern,
 collectionFieldChanged, newInformation, extraInformation,
 context, category, subCategory,
 pendingTestsIds, markSampleAsUnsafe, isActive
) values
('29', 'A',
 'BLOODABO', 'A', '',
 'RECORD_BLOOD_TYPING_OUTCOMES', 'BLOODTYPING', 'BLOODABO',
 '', '0', '0'
 ),
('29', 'B',
 'BLOODABO', 'B', '',
 'RECORD_BLOOD_TYPING_OUTCOMES', 'BLOODTYPING', 'BLOODABO',
 '', '0', '0'
 ),
('29', 'AB',
 'BLOODABO', 'AB', '',
 'RECORD_BLOOD_TYPING_OUTCOMES', 'BLOODTYPING', 'BLOODABO',
 '', '0', '0'
 ),
('29', 'O',
 'BLOODABO', 'O', '',
 'RECORD_BLOOD_TYPING_OUTCOMES', 'BLOODTYPING', 'BLOODABO',
 '', '0', '0'
 ),
('30', '+',
 'BLOODRH', '+', '',
 'RECORD_BLOOD_TYPING_OUTCOMES', 'BLOODTYPING', 'BLOODRH',
 '', '0', '0'
 ),
('30', '-',
 'BLOODRH', '-', '',
 'RECORD_BLOOD_TYPING_OUTCOMES', 'BLOODTYPING', 'BLOODRH',
 '', '0', '0'
 );

insert into WorksheetType
(id, worksheetType, context, isDeleted) values
(1, 'Blood Typing', 'RECORD_BLOOD_TYPING_TESTS', '0'),
(2, 'Full Blood Typing', 'RECORD_BLOOD_TYPING_TESTS', '0'),
(3, 'TTI', 'RECORD_TTI_TESTS', '0'),
(4, 'Full TTI', 'RECORD_TTI_TESTS', '0'),
(5, 'Blood ABO/Rh', 'RECORD_BLOOD_TYPING_OUTCOMES', '0');

insert into BloodTest_WorksheetType
(bloodTests_id, worksheetTypes_id) values
(1,1),
(2,1),
(3,1),
(4,1),
(5,1),
(6,1),
(1,2),
(2,2),
(3,2),
(4,2),
(5,2),
(6,2),
(9,2),
(10,2),
(11,2),
(12,2),
(13,2),
(17,3),
(20,3),
(23,3),
(26,3),
(17,4),
(18,4),
(19,4),
(20,4),
(21,4),
(22,4),
(23,4),
(24,4),
(25,4),
(26,4),
(27,4),
(28,4),
(29,5),
(30,5);
