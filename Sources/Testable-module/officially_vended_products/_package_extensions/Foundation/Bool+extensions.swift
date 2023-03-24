//
//  Bool+extensions.swift
//  
//
//  Created by Jeremy Bannister on 3/24/23.
//

///
extension Testable where Self == Bool {
    
    ///
    @discardableResult
    public func assertTrue () throws -> Self {
        if !self {
            throw ErrorMessage("Was `false`.")
        }
        return self
    }
    
    ///
    @discardableResult
    public func assertFalse () throws -> Self {
        if self {
            throw ErrorMessage("Was `true`.")
        }
        return self
    }
}
