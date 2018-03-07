# fmpxmlresult2swift4Struct
FileMaker FMPXMLRESULT to Swift 4 Struct


FMPXMLRESULT  | Swift 4 |
 ------------ | ----------- |
TEXT          | String |
DATE          | Date |
TIMESTAMP     | Date |
TIME          | Date |
NUMBER        | Float; yet in several cases mapping this to Int would be less insane, though I'd love to have Postgres' Numeric for this.|

Sample output done in shell on a Mac; you might as well make a FileMaker XML export script if you need to do this frequently( FileMaker 5.5 and up ):
```swift
$ xsltproc fmpxmlresult2swift4Struct.xslt YourTable.fmpxmlresult.xml
struct Tablename {
  let itemID: Float
  let itemUUID: String
  let itemName: String
  let itemDescription: String
}
```

```swift
$ xsltproc fmpxmlresult2swift4Enum.xslt YourTable.fmpxmlresult.xml
enum Tablename {
  case itemID( Float )
  case itemUUID( String )
  case itemName( String )
  case itemDescription( String )
}

var TablenameitemID = Tablename.itemID("test")
var TablenameitemUUID = Tablename.itemUUID("test")
var TablenameitemName = Tablename.itemName("test")
var TablenameitemDescription = Tablename.itemDescription("test")

switch Tablename {
  case .itemID
    print("Output: \(itemID)")
  case .itemUUID
    print("Output: \(itemUUID)")
  case .itemName
    print("Output: \(itemName)")
  case .itemDescription
    print("Output: \(itemDescription)")
}
```


One would typically change Float to Int; and make a separate UUID datatype based on string for this use case.

This is an XSLT stylesheet to convert from FileMaker's fmpxmlresult to Swift 4's Enum and Struct for Cocoa[Touch] development saves me some typing, no records involved. This has no use if you prefer to retype stuff.

This is a PoC( Proof of Concept )

Works fine with all field types; however number field will have to be manually post validated for now.

Note that adding a layout name in the FMPXMLRESULT export; before translating using this XSLT, will make the output more complete. FileMaker does usually skip layout name on exports, if you know when FileMaker actually outputs the layout name, please enlighten me.

<img alt="[x] Format Using Layout will provoke the export to populate the LAYOUT-attribute" src="FormatUsingLayout.png" width="100%" max-width=1008>

How to use this file in terminal
---
```
xsltproc fmpxmlresult2swift4Struct.xslt YourTable.fmpxmlresult.xml > YourTablesStruct.snippet.swift
xsltproc fmpxmlresult2swift4Enum.xslt YourTable.fmpxmlresult.xml > YourTablesEnum.snippet.swift
```

License
=======

Copyright (c) 2018 Gjermund Gusland Thorsen, released under the MIT License.

All rights deserved.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

This piece of software comes with ABSOLUTELY NO WARRANTY, to the extent permitted by applicable law.
