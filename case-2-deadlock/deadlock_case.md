
# Deadlock Analysis & Resolution (MySQL)

## 1. Problem

A system experienced intermittent failures when updating worker salaries and department data.

Error:
"Deadlock found when trying to get lock; try restarting transaction"

This caused:

* API failures
* Data inconsistency risk
* Poor system reliability

---

## 2. Root Cause

Deadlock occurred due to inconsistent lock order between two transactions.

Transaction A:

1. Update workers table
2. Then update departments table

Transaction B:

1. Update departments table
2. Then update workers table

This created a circular wait condition.

---

## 3. Reproduction

Transaction A:
UPDATE workers SET salary = salary + 10 WHERE id = 1;
UPDATE departments SET name = 'Updated' WHERE id = 1;

Transaction B:
UPDATE departments SET name = 'New' WHERE id = 1;
UPDATE workers SET salary = salary + 5 WHERE id = 1;

---

## 4. Solution

To prevent deadlock, ensure consistent locking order across transactions.

Fix:

* Always update tables in the same order
* workers → departments

Alternative solutions:

* Reduce transaction scope
* Use proper indexing to reduce lock time

---

## 5. Result

* Eliminated deadlock errors
* Improved system stability
* Reduced transaction conflicts

---

## 6. Key Takeaway

Deadlocks are not random — they are caused by predictable locking patterns.

Controlling transaction order is the simplest and most effective solution.
