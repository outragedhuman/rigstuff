CREATE TABLE marketdata
(
  id              INT unsigned NOT NULL AUTO_INCREMENT, # Unique ID for the rec$
  time            TIMESTAMP NOT NULL,                   # Time of candle
  high            FLOAT unsigned NOT NULL,
  low             INT unsigned NOT NULL,                # Block Diff, taken at $
  open            FLOAT unsigned NOT NULL,
  close           FLOAT unsigned NOT NULL,
  volume          FLOAT unsigned NOT NULL,
  quotedvol       FLOAT unsigned NOT NULL,
  avgweighted     FLOAT unsigned NOT NULL,
  PRIMARY KEY     (id)                                  # Make the id the prima$
);

