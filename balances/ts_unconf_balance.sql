CREATE TABLE balances
(
  id              INT unsigned NOT NULL AUTO_INCREMENT, # Unique ID for the record
  time            TIMESTAMP NOT NULL,                   # Time of entry
  balance         FLOAT unsigned NOT NULL,
  PRIMARY KEY     (id)                                  # Make the id the primary key
);
