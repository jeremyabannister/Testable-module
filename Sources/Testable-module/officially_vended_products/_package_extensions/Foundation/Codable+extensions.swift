//
//  Codable+extensions.swift
//  
//
//  Created by Jeremy Bannister on 3/24/23.
//

///
extension Testable
    where Self: Codable,
          Self: Equatable {
    
    ///
    public func assertRoundTripCoding () throws {
        try JSONDecoder()
            .decode(
                Self.self,
                from: JSONEncoder().encode(self)
            )
            .assertEqual(to: self)
    }
}

