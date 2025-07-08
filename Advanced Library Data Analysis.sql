-- Problem 2: Advanced Library Data Analysis

-- 6. Average Number of Days Books Are Kept
-- select avg(ReturnDate-LoanDate) from loans 

-- 7. Members with Reservations but No Loans in the Last Year
-- select MemberID,ReservationID from reservations where MemberID not in (select loanid from loans)

-- 8. Percentage of Books Loaned Out per Category
-- select CategoryID,(count(loanid)/sum(loanid))*100 from loans 
-- inner join bookcategories on loans.bookid = bookcategories.bookid
-- group by CategoryID  

-- 9. Total Number of Loans and Reservations Per Member
-- select loans.memberid, count(loanid),count(reservationid) from loans
-- left join reservations on loans.MemberID=reservations.MemberID group by memberid


-- 10. Find Members Who Borrowed Books by the Same Author More Than Once
-- select M.firstname,A.firstname,count(*) as times_borrowe from Loans L
-- inner join Books B on L.BookID = B.BookID
-- inner join Members M on L.MemberID = M.MemberID
-- inner join Authors A on B.AuthorID = A.AuthorID
-- group by M.firstname, A.firstname
-- having count(*) > 1;
    
-- 11. List Members Who Have Both Borrowed and Reserved the Same Book
-- select memberid,bookid from loans where bookid in ( select  bookid from reservations)

-- 12. Books Loaned and Never Returned
-- select bookid,LoanDate,returndate from loans where ReturnDate is null

-- 13. Authors with the Most Borrowed Books
-- select authorid,count(loans.bookid) as no_of_books from loans 
-- inner join books on loans.bookid=books.BookID
-- group by AuthorID order by no_of_books desc

-- 14. Books Borrowed by Members Who Joined in the Last 6 Months
-- select loans.memberid, FirstName,LastName,MembershipStartDate,loandate from members 
-- inner join loans on members.memberid = loans.memberid where MembershipStartDate < date_sub(2024-12-15,interval 6 month)
