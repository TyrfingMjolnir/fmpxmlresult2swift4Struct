# fmpxmlresult2swift4Struct
FileMaker FMPXMLRESULT to Swift 4 Struct


FMPXMLRESULT  | Swift 4 |
 ------------ | ----------- |
TEXT          | String |
DATE          | Date |
TIMESTAMP     | Date |
TIME          | Date |
NUMBER        | Float |

FileMake TEXT maps to Swift4 String
CONTAINER to String
DATE to Date
TIMESTAMP to Date
TIME to Date
NUMBER to Float; yet in several cases mapping this to Int would be less insane.
