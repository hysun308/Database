/** Question 1:  Find the number of emails that mention “Obama” in the ExtractedBodyText of the email. **/
SELECT count(E.ExtractedBodyText) FROM Emails E where E.ExtractedBodyText Like "%Obama%";
/** Question 2: Among people with Aliases, find the average number of Aliases each person has. **/
SELECT AVG(TID) FROM (SELECT COUNT (A.PersonID) TID From Aliases A group by A.PersonID);
/** Question 3: Find the MetadataDateSent on which the most emails were sent and the number of emails that were sent on * that date. Note that that many emails do not have a date -- don’t include those in your count. **/
SELECT E.MetadataDateSent date,count(E.MetadataDateSent) ct FROM Emails E where date != "" group by date order by ct DESC LIMIT 1;
/** Question 4: Find out how many distinct ids refer to Hillary Clinton. Remember the hint from the homework spec! **/
SELECT count(DISTINCT A.Alias) FROM Aliases A, Persons P Where P.name LIKE "Hillary Clinton" and P.id = A.personId;
/** Question 5: Find the number of emails in the database sent by Hillary Clinton. Keep in mind that there are multiple * aliases (from the previous question) that the email could’ve been sent from. **/
SELECT count(E.SenderPersonId) FROM Emails E,Persons P WHERE P.name LIKE "Hillary Clinton" and P.id = E.SenderPersonId;
/** Question 6: Find the names of the 5 people who emailed Hillary Clinton the most. **/
SELECT P.name FROM Persons P, EmailReceivers ER, Emails E WHERE ER.PersonId = 80 and ER.EmailId = E.Id and E.SenderPersonId = P.Id group by P.Id order by count(DISTINCT E.Id) DESC LIMIT 5;
/** Question 7: Find the names of the 5 people that Hillary Clinton emailed the most. **/
SELECT P.name FROM Persons P, EmailReceivers ER, Emails E WHERE E.SenderPersonId = 80 and E.Id = ER.EmailId and ER.PersonId = P.Id group by ER.PersonId order by count(DISTINCT ER.EmailId) DESC LIMIT 5;