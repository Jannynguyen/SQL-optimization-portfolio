
# Database Audit & Debug Checklist
> **Standard Operating Procedure (SOP) for Database Performance & Integrity.**

![MySQL](https://img.shields.io) 
![PostgreSQL](https://img.shields.io)
![Performance](https://img.shields.io)

---

## Phase 1: Performance Diagnostics (The "MRI Scan")
*Find why the database is slow before touching any code.*

- [ ] **Slow Query Log:** Identify queries exceeding 1-2 seconds.
- [ ] **Execution Plan (`EXPLAIN`):** Detect `Full Table Scan` (type: ALL) vs `Index Scan`.
- [ ] **Resource Bottlenecks:** Check CPU, RAM, and Disk I/O usage peaks.
- [ ] **Connection Pooling:** Monitor active vs. idle connections to prevent "Too many connections" error.

## Phase 2: Query Optimization
*The "Medicine" to make it 100x faster.*

- [ ] **Indexing Strategy:** 
    - [x] Primary & Foreign Keys.
    - [x] Columns in `WHERE`, `JOIN`, and `ORDER BY` clauses.
    - [ ] Composite Indexes for multi-column filters.
- [ ] **SARGable Queries:** Remove functions inside `WHERE` (e.g., use `date >= '2023-01-01'` instead of `YEAR(date) = 2023`).
- [ ] **N+1 Issue:** Consolidate multiple small queries into a single `JOIN` or `IN` statement.
- [ ] **Selectivity:** Avoid `SELECT *`. Retrieve only necessary columns.

## Phase 3: Data Integrity & Safety
*Ensure data is clean, consistent, and recoverable.*

- [ ] **Constraints:** Enforce `UNIQUE`, `NOT NULL`, and `FOREIGN KEY` at the DB level.
- [ ] **Data Types:** Optimize types (e.g., `INT` for IDs, `DECIMAL` for money, `VARCHAR` length tuning).
- [ ] **Concurrency:** Analyze logs for **Deadlocks** or long-running row locks.
- [ ] **Backup Verification:** Ensure a valid backup exists before applying any schema changes.

---

## Performance Comparison Template
*Use this table when reporting results to clients:*


| Metric | Before Optimization | After Optimization | Improvement |
| :--- | :--- | :--- | :--- |
| **Response Time** | `2,450 ms` 🐌 | `12 ms` ⚡ | **200x Faster** |
| **Scan Type** | Full Table Scan | Index Seek | Optimized |
| **CPU Usage** | 85% | 15% | Lower Load |

---

### Professional Tip for Clients:
> "Don't just fix the symptoms, cure the disease. A 15-point audit ensures your system scales without crashing under heavy traffic."

---
*Created by JannyNguyen-ChienNguyen | Specialized in SQL Optimization & Database Architecture*
