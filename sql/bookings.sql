CREATE TABLE appointment_db."bookings" (
    booking_id BIGINT GENERATED ALWAYS AS IDENTITY (
        START WITH 1
        INCREMENT BY 1
    ) PRIMARY KEY,
    user_id BIGINT NOT NULL,
    trainer_id BIGINT NOT NULL,
    slot_id BIGINT NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'BOOKED',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    -- Foreign key constraints
    CONSTRAINT fk_booking_user 
        FOREIGN KEY (user_id) 
        REFERENCES appointment_db."users"(user_id) 
        ON DELETE CASCADE 
        ON UPDATE CASCADE,
    
    CONSTRAINT fk_booking_trainer
        FOREIGN KEY (trainer_id) 
        REFERENCES appointment_db."trainers"(trainer_id) 
        ON DELETE CASCADE 
        ON UPDATE CASCADE,
    
    CONSTRAINT fk_booking_slot 
        FOREIGN KEY (slot_id) 
        REFERENCES appointment_db."slots"(slot_id) 
        ON DELETE CASCADE 
        ON UPDATE CASCADE,
    
    CONSTRAINT chk_booking_status 
        CHECK (status IN ('BOOKED', 'CANCELLED', 'COMPLETED', 'INPROGRESS')),

    CONSTRAINT uq_slot_booking UNIQUE (slot_id)
);
