
USE jankalyan;

DELETE FROM scheme_benefits            WHERE scheme_id BETWEEN 101 AND 200;
DELETE FROM scheme_documents           WHERE scheme_id BETWEEN 101 AND 200;
DELETE FROM scheme_eligibility_criteria WHERE scheme_id BETWEEN 101 AND 200;
DELETE FROM schemes                    WHERE scheme_id BETWEEN 101 AND 200;

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (101,'PM Yuva Skill Development Loan Scheme','Collateral-free education loan up to ₹7.5 lakh for skill development courses at recognised institutions.','Ministry of Skill Development and Entrepreneurship','CENTRAL',NULL,'EDUCATION','https://www.nsdcindia.org/','https://www.nsdcindia.org/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (101,'age','BETWEEN','18','35');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (101,'Collateral-free loan up to ₹7.5 lakh for skill courses');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (101,'Moratorium period until course completion before repayment starts');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (101,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (101,'Admission Proof from Recognised Institution');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (101,'Bank Passbook');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (102,'National Apprenticeship Promotion Scheme','Stipend support and placement-linked apprenticeship training for youth in registered establishments.','Ministry of Skill Development and Entrepreneurship','CENTRAL',NULL,'EDUCATION','https://www.apprenticeshipindia.gov.in/','https://www.apprenticeshipindia.gov.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (102,'age','BETWEEN','18','30');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (102,'Monthly stipend support during apprenticeship training');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (102,'Industry-recognised certificate on successful completion');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (102,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (102,'Educational Qualification Certificate');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (102,'Bank Passbook');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (103,'PM Internship Scheme','Twelve month paid internship with leading companies for youth with a monthly stipend of ₹5,000.','Ministry of Corporate Affairs','CENTRAL',NULL,'EDUCATION','https://pminternship.mca.gov.in/','https://pminternship.mca.gov.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (103,'age','BETWEEN','18','25');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (103,'Monthly stipend of ₹5,000 during the internship period');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (103,'One-time insurance cover and completion certificate');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (103,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (103,'Educational Qualification Certificate');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (103,'Bank Passbook');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (104,'Central Sector Scholarship Scheme','Merit scholarship of up to ₹20,000 per year for SC, ST, OBC and EWS students pursuing college education.','Ministry of Education','CENTRAL',NULL,'EDUCATION','https://scholarships.gov.in/','https://scholarships.gov.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (104,'caste_category','IN','SC,ST,OBC,EWS',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (104,'annual_income','<=','400000',NULL);
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (104,'Scholarship of up to ₹20,000 per year for graduation');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (104,'Renewable each academic year on maintaining performance');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (104,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (104,'Caste Certificate');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (104,'Income Certificate');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (104,'Previous Year Marksheet');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (105,'National Means-cum-Merit Scholarship','Scholarship of ₹12,000 per year for meritorious students of economically weaker families in class 9 to 12.','Ministry of Education','CENTRAL',NULL,'EDUCATION','https://scholarships.gov.in/','https://scholarships.gov.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (105,'annual_income','<=','350000',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (105,'age','BETWEEN','13','18');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (105,'₹12,000 per annum to cover school expenses');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (105,'Encourages continuation of schooling up to class 12');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (105,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (105,'Income Certificate');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (105,'School Bonafide Certificate');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (106,'Prime Minister Employment Generation Programme (PMEGP)','Credit-linked subsidy up to 35 percent for setting up new micro enterprises in manufacturing and services.','Ministry of Micro, Small and Medium Enterprises','CENTRAL',NULL,'FINANCE','https://www.kviconline.gov.in/','https://www.kviconline.gov.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (106,'age','BETWEEN','18','55');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (106,'Government subsidy of 15 to 35 percent on project cost');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (106,'Bank loan up to ₹50 lakh with margin money support');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (106,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (106,'PAN Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (106,'Project Report');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (106,'Bank Passbook');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (107,'Women Entrepreneurship Platform','Mentorship, funding access, incubation and skilling support for women-led startups and enterprises.','NITI Aayog','CENTRAL',NULL,'FINANCE','https://wep.gov.in/','https://wep.gov.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (107,'gender','=','FEMALE',NULL);
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (107,'Access to funding partners and incubation support');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (107,'Mentorship and market linkage programmes for women founders');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (107,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (107,'Business Idea or Project Note');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (107,'Bank Passbook');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (108,'Senior Citizen Savings Scheme','High interest savings scheme offering 8.2 percent per annum for senior citizens with quarterly payouts.','Ministry of Finance','CENTRAL',NULL,'FINANCE','https://www.indiapost.gov.in/','https://www.indiapost.gov.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (108,'age','>=','60',NULL);
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (108,'Attractive interest rate of 8.2 percent per annum');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (108,'Quarterly interest payout and tax benefits under Section 80C');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (108,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (108,'Age Proof');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (108,'Bank Passbook');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (109,'Pradhan Mantri Vaya Vandana Yojana','Guaranteed monthly pension for senior citizens for a period of ten years with assured returns.','Ministry of Finance','CENTRAL',NULL,'INSURANCE','https://licindia.in/','https://licindia.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (109,'age','>=','60',NULL);
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (109,'Guaranteed monthly pension with assured return of principal');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (109,'No upper limit on pension amount under the scheme');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (109,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (109,'Age Proof');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (109,'Bank Passbook');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (110,'PM-JAY Health Cover for Senior Citizens (70+)','Free health cover of ₹5 lakh per family per year for all senior citizens aged 70 years and above.','Ministry of Health and Family Welfare','CENTRAL',NULL,'HEALTH','https://pmjay.gov.in/','https://pmjay.gov.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (110,'age','>=','70',NULL);
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (110,'Free treatment up to ₹5 lakh per family per year');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (110,'No income criteria for citizens above 70 years');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (110,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (110,'Age Proof');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (110,'Ration Card');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (111,'eSanjeevani Telemedicine Service','Free national tele-consultation service connecting patients with doctors through online video and audio consultations.','Ministry of Health and Family Welfare','CENTRAL',NULL,'HEALTH','https://esanjeevani.mohfw.gov.in/','https://esanjeevani.mohfw.gov.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (111,'age','BETWEEN','18','100');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (111,'Free doctor consultations from home');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (111,'E-prescription and medicine guidance for common ailments');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (111,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (111,'Mobile Number Linked to Aadhaar');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (112,'National Programme for Free Dialysis','Free dialysis sessions for BPL kidney patients at district hospitals under the National Health Mission.','Ministry of Health and Family Welfare','CENTRAL',NULL,'HEALTH','https://nhm.gov.in/','https://nhm.gov.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (112,'is_bpl','=','true',NULL);
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (112,'Free dialysis treatment at district level facilities');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (112,'Free consumables and medicines during sessions');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (112,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (112,'BPL Certificate');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (112,'Medical Report');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (113,'One Nation One Ration Card (ONORC)','National portability of ration benefits allowing eligible families to draw food grains from any fair price shop in India.','Ministry of Consumer Affairs, Food and Public Distribution','CENTRAL',NULL,'SOCIAL SECURITY','https://nfsa.gov.in/','https://nfsa.gov.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (113,'is_bpl','=','true',NULL);
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (113,'Draw ration from any fair price shop across India');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (113,'Migrant families retain full food security entitlements');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (113,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (113,'Ration Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (113,'BPL Certificate');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (114,'Mission Shakti (Integrated Women Empowerment Programme)','Umbrella scheme for safety, security and empowerment of women through One Stop Centres, SHGs and skill training.','Ministry of Women and Child Development','CENTRAL',NULL,'WOMEN & CHILD','https://wcd.nic.in/','https://wcd.nic.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (114,'gender','=','FEMALE',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (114,'age','BETWEEN','18','60');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (114,'Access to One Stop Centres for support and assistance');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (114,'Skill development and self-employment support for women');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (114,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (114,'Bank Passbook');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (114,'BPL or Income Certificate');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (115,'STEP (Support to Training and Employment Programme for Women)','Skill training in agriculture, healthcare, IT and traditional sectors for marginalised women.','Ministry of Women and Child Development','CENTRAL',NULL,'EDUCATION','https://wcd.nic.in/','https://wcd.nic.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (115,'gender','=','FEMALE',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (115,'age','BETWEEN','16','45');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (115,'Free certified skill training for women');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (115,'Placement assistance after training completion');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (115,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (115,'Educational Qualification Certificate');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (115,'Bank Passbook');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (116,'Working Women Hostel Scheme','Safe and affordable hostel accommodation with day care facilities for working women away from home.','Ministry of Women and Child Development','CENTRAL',NULL,'WOMEN & CHILD','https://wcd.nic.in/','https://wcd.nic.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (116,'gender','=','FEMALE',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (116,'age','BETWEEN','18','60');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (116,'Safe and subsidised hostel accommodation');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (116,'Day care facility for children of residents');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (116,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (116,'Employment Proof');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (116,'Income Certificate');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (117,'PM SVAMITVA (Property Card Scheme)','Drone survey based mapping of rural inhabited land followed by issuance of property cards to owners.','Ministry of Panchayati Raj','CENTRAL',NULL,'HOUSING','https://svamitva.panchayat.gov.in/','https://svamitva.panchayat.gov.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (117,'age','BETWEEN','18','100');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (117,'Legal property card for rural inhabited land holdings');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (117,'Enables loans and helps resolve property disputes');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (117,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (117,'Land or Possession Record');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (117,'Bank Passbook');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (118,'e-Shram Registration (Unorganised Workers Database)','National database with a Universal Account Number and accident insurance cover for unorganised sector workers.','Ministry of Labour and Employment','CENTRAL',NULL,'SOCIAL SECURITY','https://eshram.gov.in/','https://eshram.gov.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (118,'age','BETWEEN','16','59');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (118,'Accidental insurance cover of ₹2 lakh on registration');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (118,'Single window access to all future labour welfare schemes');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (118,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (118,'Bank Passbook');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (118,'Mobile Number Linked to Aadhaar');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (119,'National Career Service Portal','Free job matching, vocational guidance, career counselling and skill training information for job seekers.','Ministry of Labour and Employment','CENTRAL',NULL,'EDUCATION','https://www.ncs.gov.in/','https://www.ncs.gov.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (119,'age','BETWEEN','18','35');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (119,'Free registration with lakhs of verified job vacancies');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (119,'Free career counselling and vocational guidance sessions');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (119,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (119,'Resume or Educational Certificates');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (119,'Mobile Number Linked to Aadhaar');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (120,'PM Vishwakarma','Recognition and toolkit incentive of ₹15,000 plus collateral-free loans up to ₹3 lakh for 18 traditional trades of artisans.','Ministry of Micro, Small and Medium Enterprises','CENTRAL',NULL,'FINANCE','https://pmvishwakarma.gov.in/','https://pmvishwakarma.gov.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (120,'age','BETWEEN','18','60');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (120,'Toolkit incentive of ₹15,000 for traditional artisans');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (120,'Collateral-free enterprise development loan up to ₹3 lakh');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (120,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (120,'Tradition or Skill Proof');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (120,'Bank Passbook');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (121,'CGTMSE Credit Guarantee for Micro Enterprises','Government guarantee cover on collateral-free bank loans up to ₹5 crore for micro and small enterprises.','Ministry of Micro, Small and Medium Enterprises','CENTRAL',NULL,'FINANCE','https://www.cgtmse.in/','https://www.cgtmse.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (121,'age','BETWEEN','18','65');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (121,'Collateral-free loans backed by government guarantee');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (121,'Guarantee cover up to ₹5 crore for micro enterprises');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (121,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (121,'PAN Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (121,'Project Report');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (122,'Venture Capital Fund for SC and ST Entrepreneurs','Equity and concessional finance support for business ventures promoted by Scheduled Caste and Scheduled Tribe entrepreneurs.','Ministry of Social Justice and Empowerment','CENTRAL',NULL,'FINANCE','https://socialjustice.gov.in/','https://socialjustice.gov.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (122,'caste_category','IN','SC,ST',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (122,'age','BETWEEN','18','55');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (122,'Equity support up to ₹15 crore for eligible ventures');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (122,'Concessional interest on debt component');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (122,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (122,'Caste Certificate');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (122,'Business Plan');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (123,'Rehabilitation of Manual Scavengers Scheme (SRMS)','One-time cash rehabilitation, skill training and capital subsidy for liberated manual scavenger families.','Ministry of Social Justice and Empowerment','CENTRAL',NULL,'SOCIAL SECURITY','https://socialjustice.gov.in/','https://socialjustice.gov.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (123,'caste_category','IN','SC,ST',NULL);
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (123,'One-time cash assistance of ₹40,000 for rehabilitation');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (123,'Skill training with stipend and capital subsidy for livelihood');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (123,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (123,'Caste Certificate');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (123,'BPL Certificate');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (124,'Van Dhan Vikas Yojana','Support to tribal forest produce gatherers for value addition, processing and marketing of minor forest produce.','Ministry of Tribal Affairs','CENTRAL',NULL,'AGRICULTURE','https://trifed.tribal.gov.in/','https://trifed.tribal.gov.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (124,'caste_category','=','ST',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (124,'age','BETWEEN','18','60');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (124,'Better Minimum Support Price for minor forest produce');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (124,'Training and equipment for value addition enterprises');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (124,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (124,'Caste Certificate');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (124,'Bank Passbook');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (125,'Eklavya Model Residential Schools','Free quality residential schooling with hostel facilities for Scheduled Tribe students from class 6 to 12.','Ministry of Tribal Affairs','CENTRAL',NULL,'EDUCATION','https://tribal.nic.in/','https://tribal.nic.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (125,'caste_category','=','ST',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (125,'age','BETWEEN','10','18');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (125,'Free education, boarding and lodging facilities');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (125,'CBSE curriculum with special coaching for competitive exams');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (125,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (125,'Caste Certificate');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (125,'Previous School Marksheet');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (126,'Merit-cum-Means Scholarship for Minorities','Scholarship for meritorious students from economically weaker minority families pursuing technical and professional courses.','Ministry of Minority Affairs','CENTRAL',NULL,'EDUCATION','https://scholarships.gov.in/','https://scholarships.gov.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (126,'annual_income','<=','250000',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (126,'age','BETWEEN','18','30');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (126,'Course fee support up to ₹20,000 per year');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (126,'Monthly maintenance allowance during the course');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (126,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (126,'Minority Community Declaration');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (126,'Income Certificate');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (126,'Previous Year Marksheet');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (127,'Pradhan Mantri Garib Kalyan Anna Yojana','Free food grains of 5 kg per person per month to priority household ration card holders.','Ministry of Consumer Affairs, Food and Public Distribution','CENTRAL',NULL,'SOCIAL SECURITY','https://nfsa.gov.in/','https://nfsa.gov.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (127,'is_bpl','=','true',NULL);
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (127,'5 kg free food grains per person per month');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (127,'Biometric based distribution through fair price shops');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (127,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (127,'Ration Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (127,'BPL Certificate');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (128,'Sukanya Samriddhi Account','Highest interest small savings account for the education and marriage of a girl child below 21 years.','Ministry of Finance','CENTRAL',NULL,'FINANCE','https://www.indiapost.gov.in/','https://www.indiapost.gov.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (128,'gender','=','FEMALE',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (128,'age','BETWEEN','10','21');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (128,'High interest rate of 8.2 percent per annum');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (128,'Complete tax exemption on deposit, interest and withdrawal');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (128,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (128,'Date of Birth Certificate');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (128,'Guardian Identity Proof');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (129,'Anganwadi Services (ICDS)','Supplementary nutrition, immunisation, health check-ups and referral services for pregnant women and lactating mothers.','Ministry of Women and Child Development','CENTRAL',NULL,'WOMEN & CHILD','https://icds-wcd.nic.in/','https://icds-wcd.nic.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (129,'gender','=','FEMALE',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (129,'age','BETWEEN','20','45');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (129,'Supplementary nutrition for pregnant and lactating mothers');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (129,'Free immunisation and health check-up at Anganwadi centres');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (129,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (129,'MCP Card or Medical Proof');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (129,'BPL or Income Certificate');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (130,'Agriculture Infrastructure Fund','Interest subvention of 3 percent on loans up to ₹2 crore for creating post-harvest management infrastructure.','Ministry of Agriculture and Farmers Welfare','CENTRAL',NULL,'AGRICULTURE','https://agriinfra.dac.gov.in/','https://agriinfra.dac.gov.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (130,'land_holding_acres','>','0',NULL);
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (130,'3 percent interest subvention on infrastructure loans');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (130,'Credit guarantee cover for loan up to ₹2 crore');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (130,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (130,'Land Records (Khatauni or Khasra)');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (130,'Project Report');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (131,'Mission for Integrated Development of Horticulture (MIDH)','Assistance for horticulture crops, nurseries, drip systems and cold chain for fruit and vegetable growers.','Ministry of Agriculture and Farmers Welfare','CENTRAL',NULL,'AGRICULTURE','https://midhagriculture.nic.in/','https://midhagriculture.nic.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (131,'land_holding_acres','BETWEEN','0.01','10.0');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (131,'40 to 50 percent subsidy for horticulture development');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (131,'Support for nurseries, cold storage and drip systems');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (131,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (131,'Land Records (Khatauni or Khasra)');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (131,'Bank Passbook');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (132,'National Mission on Edible Oils and Oil Palm','Input subsidy and price support for oilseed and oil palm cultivation to boost domestic edible oil production.','Ministry of Agriculture and Farmers Welfare','CENTRAL',NULL,'AGRICULTURE','https://nmeo.dac.gov.in/','https://nmeo.dac.gov.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (132,'land_holding_acres','BETWEEN','0.01','10.0');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (132,'Planting material subsidy for oil palm cultivation');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (132,'Assured price support linked to market rates');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (132,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (132,'Land Records (Khatauni or Khasra)');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (132,'Bank Passbook');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (133,'National Livestock Mission (Entrepreneurship Component)','Capital subsidy up to 50 percent for entrepreneurship in poultry, sheep, goat, piggery and feed units.','Ministry of Fisheries, Animal Husbandry and Dairying','CENTRAL',NULL,'AGRICULTURE','https://nlm.udyamimitra.in/','https://nlm.udyamimitra.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (133,'age','BETWEEN','18','60');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (133,'Capital subsidy up to 50 percent of project cost');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (133,'Support for training and market linkage in livestock business');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (133,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (133,'Bank Passbook');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (133,'Project Report');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (134,'Restructured Weather Based Crop Insurance Scheme (RWBCIS)','Insurance against adverse weather events like deficit rainfall, humidity and temperature affecting crop yield.','Ministry of Agriculture and Farmers Welfare','CENTRAL',NULL,'AGRICULTURE','https://pmfby.gov.in/','https://pmfby.gov.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (134,'land_holding_acres','BETWEEN','0.01','5.0');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (134,'Cover against deficit rainfall and extreme weather');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (134,'Automatic payout based on weather station data');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (134,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (134,'Land Records (Khatauni or Khasra)');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (134,'Bank Passbook');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (135,'PM Kusum (Solar Pumps for Farmers)','Subsidy up to 60 percent for installation of stand-alone solar agriculture pumps and solarisation of grid pumps.','Ministry of New and Renewable Energy','CENTRAL',NULL,'AGRICULTURE','https://pmkusum.mnre.gov.in/','https://pmkusum.mnre.gov.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (135,'land_holding_acres','>','0',NULL);
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (135,'60 percent subsidy on solar pump installation');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (135,'Income from sale of surplus solar power to DISCOM');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (135,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (135,'Land Records (Khatauni or Khasra)');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (135,'Bank Passbook');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (136,'Affordable Rental Housing Complexes (ARHC)','Affordable rented accommodation with dormitory and single unit options for urban migrant workers and students.','Ministry of Housing and Urban Affairs','CENTRAL',NULL,'HOUSING','https://arhc.mohua.gov.in/','https://arhc.mohua.gov.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (136,'age','BETWEEN','18','60');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (136,'Affordable rental housing near workplaces');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (136,'Dormitory and single room options for migrant workers');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (136,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (136,'Employment or Student Proof');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (136,'Income Certificate');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (137,'PM Surya Ghar Muft Bijli Yojana','Rooftop solar subsidy up to ₹78,000 for households with free electricity up to 300 units per month.','Ministry of New and Renewable Energy','CENTRAL',NULL,'HOUSING','https://pmsuryaghar.gov.in/','https://pmsuryaghar.gov.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (137,'annual_income','<=','800000',NULL);
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (137,'Subsidy up to ₹78,000 on rooftop solar installation');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (137,'Free electricity up to 300 units per month');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (137,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (137,'Electricity Bill');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (137,'Income Certificate');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (138,'National Pension System (All Citizens Model)','Flexible market-linked retirement savings with tax benefits for any citizen between 18 and 70 years.','Pension Fund Regulatory and Development Authority','CENTRAL',NULL,'SOCIAL SECURITY','https://npstrusteesindia.com/','https://npstrusteesindia.com/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (138,'age','BETWEEN','18','70');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (138,'Market-linked retirement corpus with low charges');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (138,'Tax deduction up to ₹2 lakh under Section 80CCD');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (138,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (138,'PAN Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (138,'Bank Passbook');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (139,'Startup India Seed Fund Scheme','Financial assistance up to ₹20 lakh for proof of concept and market entry of DPIIT recognised startups.','Department for Promotion of Industry and Internal Trade','CENTRAL',NULL,'FINANCE','https://seedfund.startupindia.gov.in/','https://seedfund.startupindia.gov.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (139,'age','BETWEEN','18','45');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (139,'Seed funding up to ₹20 lakh through incubators');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (139,'Access to mentorship and investor networks');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (139,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (139,'Startup Registration or DPIIT Recognition');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (139,'Business Plan');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (140,'NHFDC Loans for Divyangjan Self Employment','Concessional interest loans up to ₹50 lakh from National Handicapped Finance Corporation for self-employment of persons with disabilities.','Ministry of Social Justice and Empowerment','CENTRAL',NULL,'FINANCE','https://nhfdc.nic.in/','https://nhfdc.nic.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (140,'disability_status','=','true',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (140,'age','BETWEEN','18','55');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (140,'Concessional loans up to ₹50 lakh for self-employment');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (140,'Skill training and marketing support for beneficiaries');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (140,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (140,'Disability Certificate');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (140,'Business Plan');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (141,'Maharashtra Sanjay Gandhi Niradhar Yojana','Monthly financial assistance of ₹1,500 for elderly, widowed, orphaned and disabled persons from low income families.','Department of Social Justice, Maharashtra','STATE','Maharashtra','SOCIAL SECURITY','https://mahadbt.maharashtra.gov.in/','https://mahadbt.maharashtra.gov.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (141,'state','=','Maharashtra',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (141,'age','>=','60',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (141,'is_bpl','=','true',NULL);
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (141,'Monthly assistance of ₹1,500 via Direct Benefit Transfer');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (141,'Coverage for elderly, widows, orphans and disabled persons');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (141,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (141,'Age Proof or BPL Certificate');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (141,'Bank Passbook');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (142,'Maharashtra Magel Tyala Shettale Yojana','Subsidy of up to ₹75,000 for construction of farm ponds for rain-fed farmers on demand.','Department of Agriculture, Maharashtra','STATE','Maharashtra','AGRICULTURE','https://krishi.maharashtra.gov.in/','https://krishi.maharashtra.gov.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (142,'state','=','Maharashtra',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (142,'land_holding_acres','BETWEEN','0.01','5.0');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (142,'Farm pond construction subsidy up to ₹75,000');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (142,'Improved irrigation security for rain-fed farmland');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (142,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (142,'7/12 Land Extract');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (142,'Bank Passbook');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (143,'Rajarshi Chhatrapati Shahu Maharaj Fee Reimbursement Scholarship','Full fee reimbursement and maintenance allowance for OBC, SC, ST and EWS students in professional courses in Maharashtra.','Department of Higher and Technical Education, Maharashtra','STATE','Maharashtra','EDUCATION','https://mahadbt.maharashtra.gov.in/','https://mahadbt.maharashtra.gov.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (143,'state','=','Maharashtra',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (143,'age','BETWEEN','17','30');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (143,'annual_income','<=','800000',NULL);
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (143,'Full tuition fee reimbursement for professional courses');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (143,'Monthly maintenance allowance during the course');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (143,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (143,'Caste Certificate');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (143,'Income Certificate');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (143,'Admission Proof');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (144,'Kalaignar Magalir Urimai Thogai','Monthly basic income of ₹1,000 to eligible women heads of families in Tamil Nadu.','Department of Social Welfare and Nutritious Meal Programme, Tamil Nadu','STATE','Tamil Nadu','WOMEN & CHILD','https://www.tn.gov.in/','https://www.tn.gov.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (144,'state','=','Tamil Nadu',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (144,'gender','=','FEMALE',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (144,'annual_income','<=','250000',NULL);
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (144,'Monthly basic income of ₹1,000 for women heads of family');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (144,'Direct transfer to bank account every month');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (144,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (144,'Income Certificate');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (144,'Bank Passbook');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (145,'Chief Minister Comprehensive Health Insurance Scheme (TN CMCHIS)','Free medical treatment up to ₹5 lakh per family in government and empanelled private hospitals.','Department of Health and Family Welfare, Tamil Nadu','STATE','Tamil Nadu','HEALTH','https://www.tn.gov.in/','https://www.tn.gov.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (145,'state','=','Tamil Nadu',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (145,'is_bpl','=','true',NULL);
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (145,'Cashless treatment up to ₹5 lakh per family');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (145,'Coverage in both government and private hospitals');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (145,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (145,'Ration Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (145,'Income Certificate');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (146,'Naan Mudhalvan Skill Development Programme','Free skill training, career guidance and placement support for college and school students of Tamil Nadu.','Special Initiatives Department, Tamil Nadu','STATE','Tamil Nadu','EDUCATION','https://naanmudhalvan.tn.gov.in/','https://naanmudhalvan.tn.gov.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (146,'state','=','Tamil Nadu',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (146,'age','BETWEEN','18','35');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (146,'Free industry-aligned skill training courses');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (146,'Placement drives and internship opportunities');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (146,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (146,'Student ID or Bonafide Certificate');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (146,'Bank Passbook');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (147,'UP Vriddhavastha Pension Yojana','Monthly pension of ₹1,000 for senior citizens of BPL families residing in Uttar Pradesh.','Department of Social Welfare, Uttar Pradesh','STATE','Uttar Pradesh','SOCIAL SECURITY','https://sspy-up.gov.in/','https://sspy-up.gov.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (147,'state','=','Uttar Pradesh',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (147,'age','>=','60',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (147,'is_bpl','=','true',NULL);
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (147,'Monthly pension of ₹1,000 via Direct Benefit Transfer');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (147,'Pension status tracking on the state portal');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (147,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (147,'Age Proof');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (147,'BPL Certificate');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (147,'Bank Passbook');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (148,'Mukhyamantri Kisan Kalyan Yojana (UP)','Additional financial assistance to farmer families already covered under PM-KISAN in Uttar Pradesh.','Department of Agriculture, Uttar Pradesh','STATE','Uttar Pradesh','AGRICULTURE','https://upagripardarshi.gov.in/','https://upagripardarshi.gov.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (148,'state','=','Uttar Pradesh',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (148,'land_holding_acres','BETWEEN','0.01','2.0');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (148,'Additional annual assistance along with PM-KISAN instalments');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (148,'Priority access to state input subsidy programmes');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (148,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (148,'Land Records (Khatauni)');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (148,'Bank Passbook');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (149,'UP Post Matric Scholarship for SC and ST Students','Tuition fee reimbursement and maintenance allowance for SC and ST students pursuing class 11 to post-graduation.','Department of Social Welfare, Uttar Pradesh','STATE','Uttar Pradesh','EDUCATION','https://scholarship.up.gov.in/','https://scholarship.up.gov.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (149,'state','=','Uttar Pradesh',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (149,'caste_category','IN','SC,ST',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (149,'annual_income','<=','250000',NULL);
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (149,'Full tuition fee reimbursement for eligible courses');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (149,'Academic maintenance allowance during studies');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (149,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (149,'Caste Certificate');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (149,'Income Certificate');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (149,'Previous Year Marksheet');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (150,'Bihar Kanya Suraksha Yojana','One-time grant deposited in Sukanya Samriddhi account for girl children born in BPL families of Bihar.','Department of Social Welfare, Bihar','STATE','Bihar','WOMEN & CHILD','https://www.bihar.gov.in/','https://www.bihar.gov.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (150,'state','=','Bihar',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (150,'gender','=','FEMALE',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (150,'is_bpl','=','true',NULL);
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (150,'Government grant into the girl child savings account');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (150,'Support for education and marriage expenses later in life');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (150,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (150,'Birth Certificate');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (150,'BPL Certificate');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (151,'Mukhyamantri Jan Swasthya Abhiyan (Bihar)','Free in-patient and out-patient medical care up to ₹5 lakh for poor families in empanelled hospitals.','Department of Health, Bihar','STATE','Bihar','HEALTH','https://statehealthsocietybihar.org/','https://statehealthsocietybihar.org/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (151,'state','=','Bihar',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (151,'is_bpl','=','true',NULL);
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (151,'Cashless inpatient treatment up to ₹5 lakh');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (151,'Free diagnostics and follow-up consultations');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (151,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (151,'Ration Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (151,'BPL Certificate');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (152,'Kushal Yuva Program (Bihar)','Soft skills, IT and communication training with certification for youth of Bihar aged 15 to 25.','Department of Labour Resources, Bihar','STATE','Bihar','EDUCATION','https://www.7nishchay-yuvaupmission.bihar.gov.in/','https://www.7nishchay-yuvaupmission.bihar.gov.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (152,'state','=','Bihar',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (152,'age','BETWEEN','15','25');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (152,'Free soft skills and IT training with certification');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (152,'Improved employability and job interview readiness');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (152,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (152,'Educational Qualification Certificate');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (152,'Bihar Domicile Certificate');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (153,'Odisha Mission Shakti','Organisation, training and revolving fund support to women Self Help Groups for livelihood enterprises.','Department of Mission Shakti, Odisha','STATE','Odisha','WOMEN & CHILD','https://missionshakti.odisha.gov.in/','https://missionshakti.odisha.gov.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (153,'state','=','Odisha',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (153,'gender','=','FEMALE',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (153,'is_bpl','=','true',NULL);
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (153,'Interest-free loans up to ₹5 lakh for SHG enterprises');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (153,'Training and marketing support for women livelihoods');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (153,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (153,'SHG Membership Proof');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (153,'Bank Passbook');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (154,'Odisha Farmer Interest Subvention','Interest free crop loans up to ₹1 lakh for farmers repaying on time in Odisha.','Department of Agriculture and Farmers Empowerment, Odisha','STATE','Odisha','AGRICULTURE','https://agriodisha.nic.in/','https://agriodisha.nic.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (154,'state','=','Odisha',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (154,'land_holding_acres','BETWEEN','0.01','5.0');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (154,'Interest free crop loans up to ₹1 lakh');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (154,'Automatic interest rebate on timely repayment');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (154,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (154,'Land Records (Khatiyan)');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (154,'Bank Passbook');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (155,'Kalinga Sikhya Sathi Yojana (Odisha)','Education loan up to ₹10 lakh at an effective 1 percent interest for higher studies students of Odisha.','Department of Higher Education, Odisha','STATE','Odisha','EDUCATION','https://heodisha.gov.in/','https://heodisha.gov.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (155,'state','=','Odisha',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (155,'age','BETWEEN','18','30');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (155,'Education loan up to ₹10 lakh at 1 percent interest');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (155,'No collateral requirement for approved courses');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (155,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (155,'Admission Proof');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (155,'Bank Passbook');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (156,'Assam Swablamban Mahila Loan','Start-up loan up to ₹1 lakh for women entrepreneurs to establish or expand micro enterprises.','Department of Industries and Commerce, Assam','STATE','Assam','FINANCE','https://www.assam.gov.in/','https://www.assam.gov.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (156,'state','=','Assam',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (156,'gender','=','FEMALE',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (156,'annual_income','<=','300000',NULL);
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (156,'Start-up loan up to ₹1 lakh at subsidised interest');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (156,'Business mentoring and Follow-up support');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (156,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (156,'Project Report');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (156,'Bank Passbook');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (157,'Atal Amrit Abhiyan (Assam)','Health coverage of ₹2 lakh per family per year for treatment of critical illnesses for families with income up to ₹5 lakh.','Department of Health and Family Welfare, Assam','STATE','Assam','HEALTH','https://atalamrit.assam.gov.in/','https://atalamrit.assam.gov.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (157,'state','=','Assam',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (157,'annual_income','<=','500000',NULL);
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (157,'Cashless critical illness treatment up to ₹2 lakh');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (157,'Covers 437 procedures across multiple specialties');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (157,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (157,'Income Certificate');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (157,'Ration Card');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (158,'Swami Vivekananda Assam Youth Empowerment (SVAYEM)','Grant of ₹25,000 to ₹5 lakh for youth of Assam for self-employment and micro enterprise development.','Department of Finance, Assam','STATE','Assam','FINANCE','https://svayem.assam.gov.in/','https://svayem.assam.gov.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (158,'state','=','Assam',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (158,'age','BETWEEN','18','40');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (158,'Financial grant of ₹25,000 to ₹5 lakh with no collateral');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (158,'Skill training support for new enterprises');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (158,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (158,'Bank Passbook');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (158,'Business Plan');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (159,'Kerala Old Age Pension Scheme','Monthly pension of ₹1,600 for destitute senior citizens without any means of subsistence in Kerala.','Department of Social Justice, Kerala','STATE','Kerala','SOCIAL SECURITY','https://socialsecurity.kerala.gov.in/','https://socialsecurity.kerala.gov.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (159,'state','=','Kerala',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (159,'age','>=','60',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (159,'is_bpl','=','true',NULL);
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (159,'Monthly pension of ₹1,600 via Direct Benefit Transfer');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (159,'Entitlement eligibility follows the state welfare programmes');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (159,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (159,'Age Proof');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (159,'BPL Certificate');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (160,'Kerala Rainfall Insurance Scheme','Insurance for farmers against crop loss caused by deficit or excess rainfall during cultivation seasons.','Department of Agriculture Development and Farmers Welfare, Kerala','STATE','Kerala','INSURANCE','https://keralaagriculture.gov.in/','https://keralaagriculture.gov.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (160,'state','=','Kerala',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (160,'land_holding_acres','BETWEEN','0.01','5.0');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (160,'Automatic payout on rainfall deviation from normal levels');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (160,'Subsidised premium for farmers');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (160,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (160,'Land Records (Possession Certificate)');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (160,'Bank Passbook');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (161,'Kerala Suvarna Jubilee Education Loan','Education loan up to ₹20 lakh at subsidised 4 percent interest for students of Kerala for higher studies.','Department of Higher Education, Kerala','STATE','Kerala','EDUCATION','https://www.kerala.gov.in/','https://www.kerala.gov.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (161,'state','=','Kerala',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (161,'age','BETWEEN','18','30');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (161,'Education loan up to ₹20 lakh at subsidised interest');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (161,'Covers tuition, hostel and other academic expenses');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (161,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (161,'Admission Proof');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (161,'Bank Passbook');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (162,'Kanyashree Prakalpa (West Bengal)','Conditional cash transfer of ₹1,000 per year and ₹25,000 on maturity to delay marriage and keep girls in school.','Department of Women and Child Development and Social Welfare, West Bengal','STATE','West Bengal','WOMEN & CHILD','https://wbkanyashree.gov.in/','https://wbkanyashree.gov.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (162,'state','=','West Bengal',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (162,'gender','=','FEMALE',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (162,'age','BETWEEN','13','21');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (162,'Annual scholarship of ₹1,000 while unmarried and in school');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (162,'One-time grant of ₹25,000 at the age of 18');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (162,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (162,'Birth Certificate');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (162,'Student ID or Bonafide Certificate');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (163,'Swasthya Sathi (West Bengal)','Universal health cover of ₹5 lakh per family per year for all families of West Bengal in empanelled hospitals.','Department of Health and Family Welfare, West Bengal','STATE','West Bengal','HEALTH','https://swasthyasathi.gov.in/','https://swasthyasathi.gov.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (163,'state','=','West Bengal',NULL);
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (163,'Cashless treatment up to ₹5 lakh per family per year');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (163,'No income criteria and no restriction on family size');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (163,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (163,'Swasthya Sathi Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (163,'Ration Card');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (164,'Yuvasree (West Bengal)','Unemployment allowance of ₹1,500 per month for registered unemployed youth pursuing job search.','Department of Labour, West Bengal','STATE','West Bengal','SOCIAL SECURITY','https://yuvasree.wblabour.gov.in/','https://yuvasree.wblabour.gov.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (164,'state','=','West Bengal',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (164,'age','BETWEEN','18','40');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (164,'Monthly unemployment allowance of ₹1,500');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (164,'Free skill training linkages for registered youth');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (164,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (164,'Educational Qualification Certificate');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (164,'Employment Exchange Registration');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (165,'Rajasthan OldAge Pension Scheme','Monthly pension of ₹1,150 for senior citizens belonging to economically weaker households of Rajasthan.','Department of Social Justice and Empowerment, Rajasthan','STATE','Rajasthan','SOCIAL SECURITY','https://sje.rajasthan.gov.in/','https://sje.rajasthan.gov.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (165,'state','=','Rajasthan',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (165,'age','>=','60',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (165,'is_bpl','=','true',NULL);
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (165,'Monthly pension of ₹1,150 via Direct Benefit Transfer');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (165,'Integrated with the state Jan Aadhaar registry');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (165,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (165,'Age Proof');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (165,'BPL Certificate');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (166,'Rajasthan Sprinkler and Drip Irrigation Subsidy','Subsidy up to 75 percent for installation of drip and sprinkler irrigation systems for water scarcity regions.','Department of Agriculture, Rajasthan','STATE','Rajasthan','AGRICULTURE','https://rajkisan.rajasthan.gov.in/','https://rajkisan.rajasthan.gov.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (166,'state','=','Rajasthan',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (166,'land_holding_acres','BETWEEN','0.01','5.0');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (166,'Subsidy up to 75 percent on micro irrigation systems');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (166,'Water savings of up to 50 percent in cultivation');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (166,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (166,'Land Records (Jamabandi)');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (166,'Bank Passbook');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (167,'Rajasthan Yuva Sambal Yojana','Unemployment allowance of ₹3,500 to ₹4,500 per month for educated unemployed youth of Rajasthan.','Department of Employment, Rajasthan','STATE','Rajasthan','SOCIAL SECURITY','https://employmentsall.rajasthan.gov.in/','https://employmentsall.rajasthan.gov.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (167,'state','=','Rajasthan',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (167,'age','BETWEEN','21','40');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (167,'Monthly allowance of ₹3,500 to ₹4,500');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (167,'Priority linkage to state job fairs and skilling programmes');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (167,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (167,'Educational Qualification Certificate');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (167,'Employment Exchange Registration');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (168,'Gujarat Women Entrepreneurship Scheme','Loan and subsidy support for women to set up micro and small enterprises in Gujarat.','Department of Industries, Gujarat','STATE','Gujarat','FINANCE','https://indextb.com/','https://indextb.com/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (168,'state','=','Gujarat',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (168,'gender','=','FEMALE',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (168,'annual_income','<=','300000',NULL);
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (168,'Margin money assistance for new enterprises');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (168,'Interest subsidy on bank loans for women entrepreneurs');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (168,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (168,'Project Report');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (168,'Bank Passbook');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (169,'Mukhyamantri Amrutam Yojana (MA-Gujarat)','Free health cover of ₹5 lakh per family for BPL families of Gujarat for treatment in empanelled hospitals.','Department of Health and Family Welfare, Gujarat','STATE','Gujarat','HEALTH','https://gujhealth.gujarat.gov.in/','https://gujhealth.gujarat.gov.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (169,'state','=','Gujarat',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (169,'annual_income','<=','300000',NULL);
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (169,'Cashless hospitalisation up to ₹5 lakh per family');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (169,'Coverage of 1000 plus procedures in empanelled hospitals');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (169,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (169,'Income Certificate');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (169,'Ration Card');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (170,'Mukhyamantri Yuva Swavalamban Yojana (MYSY, Gujarat)','Education loan interest subsidy up to ₹3 lakh for students from Gujarat pursuing higher professional education.','Department of Education, Gujarat','STATE','Gujarat','EDUCATION','https://mysy.gujarat.gov.in/','https://mysy.gujarat.gov.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (170,'state','=','Gujarat',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (170,'age','BETWEEN','18','30');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (170,'Education loan interest subsidy up to ₹3 lakh');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (170,'Support for both self-financed and government institutions');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (170,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (170,'Admission Proof');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (170,'Income Certificate');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (171,'Punjab Old Age Pension','Monthly pension of ₹1,500 for destitute senior citizens belonging to eligible households in Punjab.','Department of Social Security and Development of Women and Children, Punjab','STATE','Punjab','SOCIAL SECURITY','https://socialsecurity.punjab.gov.in/','https://socialsecurity.punjab.gov.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (171,'state','=','Punjab',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (171,'age','>=','60',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (171,'is_bpl','=','true',NULL);
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (171,'Monthly pension of ₹1,500 via Direct Benefit Transfer');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (171,'Doorstep verification and Easy status tracking');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (171,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (171,'Age Proof');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (171,'Bank Passbook');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (172,'Punjab Farm Machinery Subsidy','Subsidy up to 50 percent for purchase of farm machinery like Happy Seeder, super seeders and balers.','Department of Agriculture and Farmers Welfare, Punjab','STATE','Punjab','AGRICULTURE','https://agrimpbedoop.in/','https://agrimpbedoop.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (172,'state','=','Punjab',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (172,'land_holding_acres','BETWEEN','0.01','5.0');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (172,'Subsidy up to 50 percent on approved farm machinery');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (172,'Support for stubble management equipment');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (172,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (172,'Land Records (Fard)');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (172,'Bank Passbook');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (173,'Punjab Post Matric Scholarship for SC Students','Complete tuition reimbursement and maintenance allowance for Scheduled Caste students in Punjab.','Department of Social Justice and Empowerment, Punjab','STATE','Punjab','EDUCATION','https://scholarships.gov.in/','https://scholarships.gov.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (173,'state','=','Punjab',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (173,'caste_category','IN','SC,ST',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (173,'annual_income','<=','250000',NULL);
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (173,'Full tuition reimbursement for eligible courses');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (173,'Book grant and academic maintenance allowance');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (173,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (173,'Caste Certificate');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (173,'Income Certificate');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (173,'Previous Year Marksheet');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (174,'Karnataka Gruha Lakshmi Scheme','Monthly assistance of ₹2,000 to women heads of eligible households in Karnataka.','Department of Women and Child Development, Karnataka','STATE','Karnataka','WOMEN & CHILD','https://grualakshmi.karnataka.gov.in/','https://grualakshmi.karnataka.gov.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (174,'state','=','Karnataka',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (174,'gender','=','FEMALE',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (174,'annual_income','<=','300000',NULL);
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (174,'Monthly assistance of ₹2,000 for women heads of household');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (174,'Direct transfer to the registered bank account');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (174,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (174,'Ration Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (174,'Bank Passbook');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (175,'Ayushman Arogya Karnataka','State health scheme covering tertiary treatment costs up to ₹5 lakh for eligible families of Karnataka.','Department of Health and Family Welfare, Karnataka','STATE','Karnataka','HEALTH','https://arahp.karnataka.gov.in/','https://arahp.karnataka.gov.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (175,'state','=','Karnataka',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (175,'annual_income','<=','500000',NULL);
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (175,'Cashless tertiary treatment up to ₹5 lakh per family');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (175,'Birth to end-of-life health coverage for enrolled families');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (175,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (175,'Ration Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (175,'Income Certificate');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (176,'Karnataka SCSP and TSP Post Matric Scholarship','Fee reimbursement and scholarship for Scheduled Caste and Scheduled Tribe students under the SCSP and TSP plans.','Department of Social Welfare, Karnataka','STATE','Karnataka','EDUCATION','https://sw.kar.nic.in/','https://sw.kar.nic.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (176,'state','=','Karnataka',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (176,'caste_category','IN','SC,ST',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (176,'annual_income','<=','250000',NULL);
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (176,'Fee reimbursement for post matriculation courses');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (176,'Maintenance allowance paid directly to the student');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (176,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (176,'Caste Certificate');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (176,'Income Certificate');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (176,'Previous Year Marksheet');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (177,'Madhya Pradesh Old Age Pension','Monthly pension of ₹600 or more for destitute senior citizens of the state.','Department of Social Welfare, Madhya Pradesh','STATE','Madhya Pradesh','SOCIAL SECURITY','https://samswayam.mp.gov.in/','https://samswayam.mp.gov.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (177,'state','=','Madhya Pradesh',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (177,'age','>=','60',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (177,'is_bpl','=','true',NULL);
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (177,'Monthly pension via Direct Benefit Transfer');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (177,'Samagra based verification and Easy status tracking');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (177,'Samagra ID');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (177,'Age Proof');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (177,'BPL Certificate');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (178,'Madhya Pradesh Farm Machinery and Drip Subsidy','Subsidy on tractors, power tillers and micro irrigation equipment for farmers of Madhya Pradesh.','Department of Farmer Welfare and Agriculture Development, Madhya Pradesh','STATE','Madhya Pradesh','AGRICULTURE','https://mpkrishi.mp.gov.in/','https://mpkrishi.mp.gov.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (178,'state','=','Madhya Pradesh',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (178,'land_holding_acres','BETWEEN','0.01','5.0');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (178,'Subsidy of 40 to 50 percent on farm machinery');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (178,'Micro irrigation support through the state water programme');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (178,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (178,'Land Records (Khasra)');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (178,'Bank Passbook');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (179,'Madhya Pradesh Post Matric Scholarship','Scholarship and fee reimbursement for SC, ST and OBC students of Madhya Pradesh after class 10.','Department of Higher Education, Madhya Pradesh','STATE','Madhya Pradesh','EDUCATION','https://www.mpesc.in/','https://www.mpesc.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (179,'state','=','Madhya Pradesh',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (179,'caste_category','IN','SC,ST,OBC',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (179,'annual_income','<=','250000',NULL);
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (179,'Course fee reimbursement and maintenance allowance');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (179,'Renewable for the entire course duration');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (179,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (179,'Caste Certificate');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (179,'Income Certificate');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (179,'Previous Year Marksheet');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (180,'Aarogyasri Health Scheme (Telangana)','Cashless treatment up to ₹10 lakh per family per year for BPL families in empanelled hospitals.','Department of Health, Telangana','STATE','Telangana','HEALTH','https://www.druggartelangana.gov.in/','https://www.druggartelangana.gov.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (180,'state','=','Telangana',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (180,'is_bpl','=','true',NULL);
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (180,'Cashless treatment up to ₹10 lakh per family per year');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (180,'Coverage for serious illnesses at empanelled hospitals');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (180,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (180,'White Ration Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (180,'Income Certificate');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (181,'Kalyana Lakshmi and Shaadi Mubarak (Telangana)','One-time grant of ₹1,25,000 for the marriage of girls from eligible families of Telangana.','Department of Women, Children, Disabled and Senior Citizens Welfare, Telangana','STATE','Telangana','WOMEN & CHILD','https://telanganaepass.cgg.gov.in/','https://telanganaepass.cgg.gov.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (181,'state','=','Telangana',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (181,'gender','=','FEMALE',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (181,'annual_income','<=','200000',NULL);
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (181,'One-time grant of ₹1,25,000 at the time of marriage');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (181,'Payment made directly to the marriage authority');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (181,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (181,'Caste or Community Certificate');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (181,'Income Certificate');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (182,'Yuva Nestam (Telangana)','Unemployment allowance of ₹3,016 per month for eligible unemployed youth of Telangana.','Department of Labour, Telangana','STATE','Telangana','SOCIAL SECURITY','https://www.rjmdobt.cgg.gov.in/','https://www.rjmdobt.cgg.gov.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (182,'state','=','Telangana',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (182,'age','BETWEEN','18','35');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (182,'Monthly unemployment allowance of ₹3,016');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (182,'Linkage to state skill development programmes');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (182,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (182,'Educational Qualification Certificate');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (183,'AP NTR Vaidya Seva Old Age Pension','Monthly pension of ₹3,000 for eligible senior citizens, widows and weavers of Andhra Pradesh.','Department of Rural Development, Andhra Pradesh','STATE','Andhra Pradesh','SOCIAL SECURITY','https://prd.ap.gov.in/','https://prd.ap.gov.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (183,'state','=','Andhra Pradesh',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (183,'age','>=','60',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (183,'is_bpl','=','true',NULL);
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (183,'Monthly pension of ₹3,000 via Direct Benefit Transfer');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (183,'Pension paid on 1st of every month at village secretariat');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (183,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (183,'Age Proof');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (183,'BPL Certificate');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (183,'Bank Passbook');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (184,'YSR Rythu Bharosa (Andhra Pradesh)','Additional annual financial assistance of ₹13,500 to farmers along with PM-KISAN benefits.','Department of Agriculture, Andhra Pradesh','STATE','Andhra Pradesh','AGRICULTURE','https://ysrrythubharosa.ap.gov.in/','https://ysrrythubharosa.ap.gov.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (184,'state','=','Andhra Pradesh',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (184,'land_holding_acres','BETWEEN','0.01','2.0');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (184,'Additional assistance of ₹13,500 per year for farmers');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (184,'Coverage extended for tenant farmers without land records');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (184,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (184,'Land Records (Pattadar passbook)');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (184,'Bank Passbook');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (185,'Jagananna Vidya Deevena (Andhra Pradesh)','Full fee reimbursement for SC, ST, OBC and minority students pursuing professional courses in Andhra Pradesh.','Department of Social Welfare, Andhra Pradesh','STATE','Andhra Pradesh','EDUCATION','https://jnanabhumi.ap.gov.in/','https://jnanabhumi.ap.gov.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (185,'state','=','Andhra Pradesh',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (185,'caste_category','IN','SC,ST,OBC,EWS',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (185,'annual_income','<=','250000',NULL);
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (185,'Full tuition fee reimbursement paid to the institution');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (185,'No interest education loan option for related expenses');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (185,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (185,'Caste Certificate');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (185,'Income Certificate');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (185,'Admission Proof');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (186,'Haryana Women Empowerment Grant','Financial support for skill development, self-employment and welfare of eligible women of Haryana.','Department of Women and Child Development, Haryana','STATE','Haryana','WOMEN & CHILD','https://wcdhry.gov.in/','https://wcdhry.gov.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (186,'state','=','Haryana',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (186,'gender','=','FEMALE',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (186,'annual_income','<=','300000',NULL);
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (186,'Skill training and enterprise support for women');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (186,'Access to shelter and counselling services');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (186,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (186,'Parivar Pehchan Patra (PPP)');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (186,'Bank Passbook');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (187,'Chirayu Haryana Yojana','Family health cover up to ₹5 lakh per year for families with annual income up to ₹3 lakh in Haryana.','Department of Health, Haryana','STATE','Haryana','HEALTH','https://healthharyana.gov.in/','https://healthharyana.gov.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (187,'state','=','Haryana',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (187,'annual_income','<=','500000',NULL);
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (187,'Cashless treatment up to ₹5 lakh per family per year');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (187,'Free OPD consultation and diagnostics at dispensaries');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (187,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (187,'Parivar Pehchan Patra (PPP)');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (187,'Income Certificate');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (188,'Saksham Yuva (Haryana)','Unemployment allowance of ₹1,000 to ₹2,000 per month for educated unemployed youth of Haryana.','Department of Employment, Haryana','STATE','Haryana','SOCIAL SECURITY','https://hrylabour.gov.in/','https://hrylabour.gov.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (188,'state','=','Haryana',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (188,'age','BETWEEN','18','35');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (188,'Monthly allowance of ₹1,000 to ₹2,000');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (188,'Deposit scheme option while attending job interviews');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (188,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (188,'Educational Qualification Certificate');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (188,'Employment Exchange Registration');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (189,'Jharkhand Old Age Pension','Monthly pension of ₹1,000 for eligible BPL senior citizens of Jharkhand.','Department of Social Welfare, Jharkhand','STATE','Jharkhand','SOCIAL SECURITY','https://socialwelfare.jharkhand.gov.in/','https://socialwelfare.jharkhand.gov.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (189,'state','=','Jharkhand',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (189,'age','>=','60',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (189,'is_bpl','=','true',NULL);
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (189,'Monthly pension of ₹1,000 via state DBT gateway');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (189,'Aadhaar seeding for seamless payments');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (189,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (189,'Age Proof');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (189,'BPL Certificate');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (190,'Jharkhand Farmer Support Scheme','Interest free short-term crop loans and input subsidy for small farmers of Jharkhand.','Department of Agriculture, Animal Husbandry and Co-operative, Jharkhand','STATE','Jharkhand','AGRICULTURE','https://agricoop.jharkhand.gov.in/','https://agricoop.jharkhand.gov.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (190,'state','=','Jharkhand',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (190,'land_holding_acres','BETWEEN','0.01','5.0');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (190,'Interest free crop loans up to ₹50,000');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (190,'Input subsidy for seeds, fertilizers and pesticides');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (190,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (190,'Land Records (Mutation or Jamabandi)');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (190,'Bank Passbook');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (191,'Jharkhand Post Matric Scholarship','Scholarship for SC, ST and OBC students of Jharkhand pursuing post matriculation courses.','Department of Welfare, Jharkhand','STATE','Jharkhand','EDUCATION','https://ekalyan.cgg.gov.in/','https://ekalyan.cgg.gov.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (191,'state','=','Jharkhand',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (191,'caste_category','IN','SC,ST,OBC',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (191,'annual_income','<=','250000',NULL);
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (191,'Fee reimbursement and monthly maintenance allowance');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (191,'Renewable annually on basis of academic performance');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (191,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (191,'Caste Certificate');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (191,'Income Certificate');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (191,'Previous Year Marksheet');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (192,'Mahtari Vandana Yojana (Chhattisgarh)','Monthly financial assistance of ₹1,000 to eligible women sisters of Chhattisgarh.','Department of Women and Child Development, Chhattisgarh','STATE','Chhattisgarh','WOMEN & CHILD','https://mahtarivandan.cg.gov.in/','https://mahtarivandan.cg.gov.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (192,'state','=','Chhattisgarh',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (192,'gender','=','FEMALE',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (192,'annual_income','<=','250000',NULL);
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (192,'Monthly assistance of ₹1,000 for eligible women');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (192,'Direct transfer to the linked bank account');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (192,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (192,'Income Certificate');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (192,'Bank Passbook');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (193,'Dr. Khubchand Baghel Swasthya Sahayata Yojana (Chhattisgarh)','Financial assistance for treatment of serious illnesses for poor families of Chhattisgarh.','Department of Health and Family Welfare, Chhattisgarh','STATE','Chhattisgarh','HEALTH','https://cghealth.nic.in/','https://cghealth.nic.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (193,'state','=','Chhattisgarh',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (193,'is_bpl','=','true',NULL);
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (193,'Cashless or reimbursed treatment for critical illnesses');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (193,'Coverage extended to antenatal and emergency care');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (193,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (193,'BPL Certificate');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (193,'Ration Card');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (194,'Chhattisgarh Unemployment Allowance','Monthly allowance between ₹1,300 and ₹2,500 for registered educated unemployed youth of Chhattisgarh.','Department of Employment, Chhattisgarh','STATE','Chhattisgarh','SOCIAL SECURITY','https://cgemployment.gov.in/','https://cgemployment.gov.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (194,'state','=','Chhattisgarh',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (194,'age','BETWEEN','18','35');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (194,'Monthly allowance of ₹1,300 to ₹2,500');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (194,'Priority admission to state skill training programmes');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (194,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (194,'Educational Qualification Certificate');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (194,'Employment Exchange Registration');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (195,'Uttarakhand Old Age Pension','Monthly pension for BPL senior citizens of Uttarakhand of ₹1,200 per month.','Department of Social Welfare, Uttarakhand','STATE','Uttarakhand','SOCIAL SECURITY','https://socialwelfare.uk.gov.in/','https://socialwelfare.uk.gov.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (195,'state','=','Uttarakhand',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (195,'age','>=','60',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (195,'is_bpl','=','true',NULL);
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (195,'Monthly pension of ₹1,200 via Direct Benefit Transfer');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (195,'Merged with national pension schemes where applicable');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (195,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (195,'Age Proof');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (195,'BPL Certificate');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (196,'Uttarakhand Farmer Subsidy Scheme','Subsidy for seeds, fertilizers, polyhouses and farm machinery for hill farmers of Uttarakhand.','Department of Agriculture, Uttarakhand','STATE','Uttarakhand','AGRICULTURE','https://agri.uk.gov.in/','https://agri.uk.gov.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (196,'state','=','Uttarakhand',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (196,'land_holding_acres','BETWEEN','0.01','5.0');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (196,'Subsidy on certified seeds and farm inputs');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (196,'Special support for polyhouse and horticulture farmers');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (196,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (196,'Land Records (LCP or Khatoni)');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (196,'Bank Passbook');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (197,'Uttarakhand Post Matric Scholarship','Scholarship for SC, ST and OBC students of Uttarakhand for higher education classes.','Department of Education, Uttarakhand','STATE','Uttarakhand','EDUCATION','https://scholarship.ua.gov.in/','https://scholarship.ua.gov.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (197,'state','=','Uttarakhand',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (197,'caste_category','IN','SC,ST,OBC',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (197,'annual_income','<=','250000',NULL);
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (197,'Fee reimbursement and maintenance scholarship');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (197,'Special allowance for students staying in hostels');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (197,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (197,'Caste Certificate');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (197,'Income Certificate');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (197,'Previous Year Marksheet');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (198,'Himachal Mahila Udyam Protsahan Yojana','Interest subsidy and margin money support for women entrepreneurs starting enterprises in Himachal Pradesh.','Department of Industries, Himachal Pradesh','STATE','Himachal Pradesh','WOMEN & CHILD','https://himachal.nic.in/','https://himachal.nic.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (198,'state','=','Himachal Pradesh',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (198,'gender','=','FEMALE',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (198,'annual_income','<=','300000',NULL);
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (198,'Margin money assistance up to 25 percent of project cost');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (198,'Interest subsidy on bank loans for women entrepreneurs');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (198,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (198,'Project Report');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (198,'Bank Passbook');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (199,'Himachal Mukhyamantri Sehat Bima Scheme','Health cover up to ₹5 lakh for eligible families of Himachal Pradesh attached to Ayushman Bharat.','Department of Health and Family Welfare, Himachal Pradesh','STATE','Himachal Pradesh','HEALTH','https://hphealth.hp.gov.in/','https://hphealth.hp.gov.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (199,'state','=','Himachal Pradesh',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (199,'is_bpl','=','true',NULL);
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (199,'Cashless treatment up to ₹5 lakh per family');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (199,'Integrated with Ayushman Bharat PM-JAY benefits');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (199,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (199,'Ration Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (199,'BPL Certificate');

INSERT INTO schemes (scheme_id, scheme_name, description, department, level, state, category, official_apply_url, official_status_check_url, is_active, source)
VALUES (200,'Himachal Berojgari Bhatta','Unemployment allowance for educated unemployed youth of Himachal Pradesh aged between 20 and 35.','Department of Employment, Himachal Pradesh','STATE','Himachal Pradesh','SOCIAL SECURITY','https://admis.hp.gov.in/','https://admis.hp.gov.in/',1,'MANUAL');
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (200,'state','=','Himachal Pradesh',NULL);
INSERT INTO scheme_eligibility_criteria (scheme_id, field_name, operator, value, value2) VALUES (200,'age','BETWEEN','20','35');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (200,'Monthly unemployment allowance until employment is found');
INSERT INTO scheme_benefits (scheme_id, benefit_description) VALUES (200,'Priority to skill development programmes of the state');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (200,'Aadhaar Card');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (200,'Educational Qualification Certificate');
INSERT INTO scheme_documents (scheme_id, document_name) VALUES (200,'Employment Exchange Registration');

SELECT level, COUNT(*) AS total FROM schemes WHERE scheme_id BETWEEN 101 AND 200 GROUP BY level;

SELECT category, COUNT(*) AS total FROM schemes WHERE scheme_id BETWEEN 101 AND 200 GROUP BY category ORDER BY total DESC;

SELECT s.scheme_id, s.scheme_name FROM schemes s
LEFT JOIN scheme_eligibility_criteria c ON c.scheme_id = s.scheme_id
WHERE s.scheme_id BETWEEN 101 AND 200 AND c.criteria_id IS NULL;

SELECT scheme_id, COUNT(*) AS criteria_count FROM scheme_eligibility_criteria
WHERE scheme_id BETWEEN 101 AND 200 GROUP BY scheme_id ORDER BY criteria_count ASC;
