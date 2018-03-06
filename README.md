# fmpxmlresult2swift4Struct
FileMaker FMPXMLRESULT to Swift 4 Struct


FMPXMLRESULT  | Swift 4 |
 ------------ | ----------- |
TEXT          | String |
DATE          | Date |
TIMESTAMP     | Date |
TIME          | Date |
NUMBER        | Float; yet in several cases mapping this to Int would be less insane, though I'd love to have Postgres' Numeric for this.|

Please consult one of my other "FMPXMLRESULT code generators" to get inspired https://github.com/TyrfingMjolnir/fmpxmlresult2nodeexpress

Sample output:
```swift
struct Tablename {
  let itemID: Float
  let itemUUID: String
  let itemName: String
  let itemDescription: String
}
```
One would typicly change Float to Int for this case.
