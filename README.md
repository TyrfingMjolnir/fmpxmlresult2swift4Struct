# fmpxmlresult2swift4Struct
FileMaker FMPXMLRESULT to Swift 4 Struct


FMPXMLRESULT  | Swift 4 |
 ------------ | ----------- |
TEXT          | String |
DATE          | Date |
TIMESTAMP     | Date |
TIME          | Date |
NUMBER        | Float; yet in several cases mapping this to Int would be less insane, though I'd love to have Postgres' Numeric for this.|
