-- Most common reason for visit
SELECT reason_for_visit, COUNT(*) AS visit_count
FROM appointments
WHERE reason_for_visit != 'Unknown'
GROUP BY reason_for_visit
ORDER BY visit_count DESC
LIMIT 1;


--- Total patients
SELECT COUNT(*) AS total_patients
FROM patients

---Revenue collected
SELECT SUM(amount_paid) as total_revenue
FROM billing;

--- Revenue by payment method
SELECT payment_method, COUNT(*) AS invoice_count
FROM billing
GROUP BY payment_method
ORDER BY invoice_count DESC;

--Patient by city
SELECT  city, COUNT(*) AS patient_count
FROM patients
GROUP BY city
ORDER BY patient_count DESC;

--- Average age
SELECT ROUND(AVG(age), 1) AS average_age
FROM patients
WHERE age IS NOT NULL;

---Appointment status
SELECT appointment_status, COUNT(*) AS appointment_count
FROM appointments
GROUP BY appointment_status
ORDER BY appointment_count DESC;


---Total appointments
SELECT COUNT(*) AS total_appointments
FROM billing;

---Doctor by speciality
SELECT specialty, COUNT(*) AS doctor_count
FROM doctors
GROUP BY specialty
ORDER BY doctor_count DESC;


---Doctor by branch
SELECT branch, COUNT(*) AS doctor_count
FROM doctors
GROUP BY branch
ORDER BY doctor_count DESC;