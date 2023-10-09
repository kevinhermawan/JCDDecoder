//
//  JSONDecoder.swift
//
//
//  Created by Kevin Hermawan on 09/10/23.
//

import CoreData
import Foundation

public extension JSONDecoder {
    static func coreDataDecoder(context: NSManagedObjectContext) -> JSONDecoder {
        let decoder = JSONDecoder()
        decoder.userInfo[CodingUserInfoKey.managedObjectContext] = context
        
        return decoder
    }
}
