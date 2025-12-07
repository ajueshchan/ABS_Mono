CREATE TABLE appointment_db."slots" (
    slot_id BIGINT GENERATED ALWAYS AS IDENTITY (
        START WITH 1
        INCREMENT BY 1
    ) PRIMARY KEY,
    provider_id BIGINT NOT NULL,
    date DATE NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    is_available BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_slot_provider 
        FOREIGN KEY (provider_id) 
        REFERENCES appointment_db."providers"(provider_id) 
        ON DELETE CASCADE 
        ON UPDATE CASCADE,
    CONSTRAINT chk_slot_time_order 
        CHECK (end_time > start_time),
    CONSTRAINT uq_provider_datetime 
        UNIQUE (provider_id, date, start_time)
);
