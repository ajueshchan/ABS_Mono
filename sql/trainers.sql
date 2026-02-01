CREATE TABLE appointment."trainers" (
    trainer_id BIGINT GENERATED ALWAYS AS IDENTITY (
        START WITH 1
        INCREMENT BY 1
    ) PRIMARY KEY,
    user_id BIGINT NOT NULL,
    name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   CONSTRAINT fk_trainer_user FOREIGN KEY (user_id) REFERENCES appointment_db."users"(user_id) 
   ON DELETE CASCADE ON UPDATE CASCADE
)
