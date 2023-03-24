//
//  Dictionary+extensions.swift
//  
//
//  Created by Jeremy Bannister on 3/24/23.
//

///
extension Dictionary where Value: Equatable {
    
    ///
    @discardableResult
    public func assertValue (forKey key: Key, equals other: Value) throws -> Self {
        
        ///
        guard let value = self[key] else {
            throw ErrorMessage("No value exists for key: \(key)")
        }
        
        ///
        guard value == other else {
            throw ErrorMessage("\(value) is not equal to \(other)")
        }
        
        ///
        return self
    }
    
    ///
    @discardableResult
    public func assertNoValue (forKey key: Key) throws -> Self {
        
        ///
        guard !keys.contains(key) else {
            throw ErrorMessage("Dictionary had value for key: \(key)")
        }
        
        ///
        return self
    }
}
