# JCDDecoder

A Swift extension that simplifies decoding JSON directly into Core Data entities.

## Overview

`JCDDecoder` is a Swift extension for `JSONDecoder` that enhances the decoding process by allowing JSON data to be seamlessly transformed into Core Data entities.

## Installation

You can add `JCDDecoder` as a dependency to your project using Swift Package Manager by adding it to the dependencies value of your `Package.swift`.

```swift
dependencies: [
    .package(url: "https://github.com/kevinhermawan/JCDDecoder.git", .upToNextMajor(from: "1.0.0"))
]
```

Alternatively, in Xcode:

1. Open your project in Xcode.
2. Click on `File` -> `Swift Packages` -> `Add Package Dependency...`
3. Enter the repository URL: `https://github.com/kevinhermawan/JCDDecoder.git`
4. Choose the version you want to add. You probably want to add the latest version.
5. Click `Add Package`.

## Usage

When making `NSManagedObject` entities conform to `Decodable`, use the `NSManagedObjectContext` provided in the decoder's `userInfo`. Here's an example with an `NSManagedObject` named `User`:

```diff
+ import JCDDecoder

  public required convenience init(from decoder: Decoder) throws {
+   guard let context = decoder.userInfo[CodingUserInfoKey.managedObjectContext] as? NSManagedObjectContext else {
+       fatalError("NSManagedObjectContext is missing in decoder's userInfo")
+   }

-   self.init()
+   self.init(context: context)
    ...
  }
```

Then, to configure your `JSONDecoder` with Core Data support:

```swift
import JCDDecoder

let decoder = JSONDecoder.coreDataDecoder(context: someManagedObjectContext)
let user = try decoder.decode(User.self, from: jsonData)
```

Once you've decoded your data, don't forget to save your managed object context:

```swift
do {
    try someManagedObjectContext.viewContext.save()
} catch {
    print("Error saving managed object context: \(error)")
}
```

## License

[MIT License](/LICENSE)
