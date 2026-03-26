
Data Integrity Issue: Duplicate Records
1. ProblemThe system allowed multiple records with the same email address.This caused:
•Duplicate user accounts
•Inconsistent data
•Issues in authentication and reporting
2. Root Cause
•No unique constraint on email column
•Application logic did not prevent duplicate inserts
3. Solution
Step 1: Identify duplicate records using GROUP BY
Step 2: Clean data by keeping only one record per email
Step 3: Add UNIQUE constraint to enforce data integrity
4. Result
•Removed duplicate records
•Prevented future duplicates
•Improved data consistency
5. Key TakeawayData integrity should be enforced at the database level, not only in application logic.Using constraints ensures long-term reliability of the system.
