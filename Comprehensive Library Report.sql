-- Problem 1: Comprehensive Library Report

-- 1. Books Not Loaned Out in the Last 6 Months
-- select * from loans where loandate < date_sub("2024-12-15", interval 6 month) 

-- 2. Top Members by Number of Books Borrowed in the Last Year
-- select count(loanid),memberid from loans group by memberid order by count(loanid) desc

-- 3. Overdue Books Report
-- select loanid, bookid,memberid , (returndate-duedate)  from loans 
-- where (returndate-duedate)  > 0

-- 4. Top 3 Most Borrowed Categories
-- select count(loanid) as TotalBorrowedBooks,CategoryName from loans 
-- inner join bookcategories on loans.BookID = bookcategories.BookID
-- inner join categories on bookcategories.CategoryID = categories.CategoryID group by CategoryName order by TotalBorrowedBooks desc limit 3

-- 5. Are there any books Belonging to Multiple Categories
-- select bookid,count(categoryid) from bookcategories group by bookid order by count(categoryid) desc 