//
//  Comparable+extensions.swift
//
//
//  Created by Jeremy Bannister on 5/21/24.
//

///
extension Comparable {
    
    ///
    @discardableResult
    public func assertGreater(
        than other: Self
    ) throws -> Self {
        
        ///
        guard self > other else {
            throw ErrorMessage("\(self) is not greater than \(other).")
        }
        
        ///
        return self
    }
    
    ///
    @discardableResult
    public func assertGreaterThanOrEqual(
        to other: Self
    ) throws -> Self {
        
        ///
        guard self >= other else {
            throw ErrorMessage("\(self) is not greater than or equal to \(other).")
        }
        
        ///
        return self
    }
    
    ///
    @discardableResult
    public func assertLess(
        than other: Self
    ) throws -> Self {
        
        ///
        guard self < other else {
            throw ErrorMessage("\(self) is not less than \(other).")
        }
        
        ///
        return self
    }
    
    ///
    @discardableResult
    public func assertLessThanOrEqual(
        to other: Self
    ) throws -> Self {
        
        ///
        guard self <= other else {
            throw ErrorMessage("\(self) is not less than or equal to \(other).")
        }
        
        ///
        return self
    }
}
