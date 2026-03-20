CREATE TABLE mail_template (
    id              BIGSERIAL       NOT NULL,
    template_name   VARCHAR(100)    NOT NULL,
    short_message   VARCHAR(255)    NOT NULL,
    long_message    TEXT            NOT NULL,
    created_ts      TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_ts      TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    status          BOOLEAN         NOT NULL DEFAULT 'Active',

    CONSTRAINT pk_mail_template         PRIMARY KEY (id),
    CONSTRAINT uq_mail_template_name    UNIQUE (template_name)
);
