ALTER TABLE STUDY
ADD CONSTRAINT STUDY_CheckEndDateGreaterThanStartDate
CHECK (EndDate >= StartDate);

ALTER TABLE CAREER
ADD CONSTRAINT CAREER_CheckEndDateGreaterThanStartDate
CHECK (EndDate >= StartDate);

ALTER TABLE INTEREST ADD CONSTRAINT TYPE_CHECK_INTEREST
CHECK (InterestType IN ('leader','group','company','education'));

ALTER TABLE PUBLISHED ADD CONSTRAINT TYPE_CHECK_PUBLISHED
CHECK (PublishedType IN ('video','image','event','article'));

ALTER TABLE MEMBER_PROFILE ADD CONSTRAINT CHECK_SEX
CHECK (Sex IN ('m','f','o'));