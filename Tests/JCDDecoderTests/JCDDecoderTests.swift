import XCTest
@testable import JCDDecoder
import CoreData

final class JCDDecoderTests: XCTestCase {
    func testCoreDataDecoder() {
        let mockContext = MockManagedObjectContext(mockConcurrencyType: .mainQueueConcurrencyType)
        let decoder = JSONDecoder.coreDataDecoder(context: mockContext)
        
        XCTAssertEqual(decoder.userInfo[CodingUserInfoKey.managedObjectContext] as? MockManagedObjectContext, mockContext)
    }
}

class MockManagedObjectContext: NSManagedObjectContext {
    init(mockConcurrencyType: NSManagedObjectContextConcurrencyType) {
        super.init(concurrencyType: mockConcurrencyType)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
