//
//  Equatable+extensions.swift
//
//
//  Created by Jeremy Bannister on 5/21/24.
//

///
extension Equatable {
    
    ///
    @discardableResult
    public func assertNotEqual(
        to other: Self
    ) throws -> Self {
        
        ///
        guard self != other else {
            throw ErrorMessage("\(self) is equal to \(other) but should not be.")
        }
        
        ///
        return self
    }
    
    ///
    @discardableResult
    public func assertEqualTo(
        _ value: ()->Self
    ) throws -> Self {
        
        ///
        try self
            .assertEqual(to: value())
    }
    
    ///
    @available(macOS 10.15.0, iOS 13.0, watchOS 6.0.0, tvOS 13.0.0, *)
    @discardableResult
    public func assertEqualTo(
        _ value: ()async ->Self
    ) async throws -> Self {
        
        ///
        try await self
            .assertEqual(to: value())
    }
    
    ///
    @discardableResult
    public func assertEqual(
        to other: Self
    ) throws -> Self {
        
        ///
        guard self == other else {
            throw ErrorMessage("\(self) is not equal to \(other).")
        }
        
        ///
        return self
    }
}
