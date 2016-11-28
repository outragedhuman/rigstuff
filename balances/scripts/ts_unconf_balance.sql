CREATE TABLE balances
(
  id              INT unsigned NOT NULL AUTO_INCREMENT, # Unique ID for the record
  time            TIMESTAMP NOT NULL,                   # Time of entry
  balance         FLOAT unsigned NOT NULL,
  difficulty      INT unsigned NOT NULL,                # Block Diff, taken at same time as balance
  PRIMARY KEY     (id)                                  # Make the id the primary key
);
