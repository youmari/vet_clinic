DROP TABLE IF EXISTS patients;

CREATE TABLE patients (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(50) NOT NULL,
  date_of_birth DATE NOT NULL
);

DROP TABLE IF EXISTS medical_histories;

CREATE TABLE medical_histories (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  admitted_at TIMESTAMP NOT NULL,
  patient_id INT NOT NULL,
  status VARCHAR(100) NOT NULL,
  FOREIGN KEY (patient_id) REFERENCES patients (id)
);

DROP TABLE IF EXISTS treatments_medical_histories;

CREATE TABLE treatments_medical_histories (
  treatment_id INT NOT NULL,
  medical_history_id INT NOT NULL,
  FOREIGN KEY (treatment_id) REFERENCES treatments (id),
  FOREIGN KEY (medical_history_id) REFERENCES medical_histories (id)

);

DROP TABLE IF EXISTS treatments;

CREATE TABLE treatments (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  type VARCHAR(50) NOT NULL,
  name VARCHAR(50) NOT NULL,
);


CREATE INDEX patient_id_index 
  ON medical_histories
  (patient_id);

CREATE INDEX invoices_id_index 
  ON invoices_items
  (invoices_id);

CREATE INDEX treatment_id_index 
  ON invoices_items
 (treatment_id);

CREATE INDEX medical_history_id_index 
  ON invoices
 (medical_history_id);

CREATE INDEX medical_history_id_index
  ON treatments_histories
  (medical_history_id)

CREATE INDEX treatment_id_index 
  ON treatments_histories
  (treatment_id)











