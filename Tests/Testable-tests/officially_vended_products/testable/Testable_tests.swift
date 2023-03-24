//
//  Testable_tests.swift
//  
//
//  Created by Jeremy Bannister on 3/23/23.
//

///
extension Testable_tests {
    
    ///
    func test_existence () {
        let _: Testable
    }
}

///
extension Testable_tests {
    
    ///
    func test_assertMap () throws {
        
        ///
        let transform: (Int)throws->Bool? = { $0 == 7 ? true : nil }
        
        ///
        try 7
            .assertMap(transform)
            .assertTrue()
        
        ///
        expectError {
            _ = try 6.assertMap(transform)
        }
    }
    
    ///
    func test_assertMap () async throws {
        
        ///
        let transform: (Int)async throws->Bool? =
            {
                try await Task.sleep(nanoseconds: 10_000_000)
                return $0 == 7 ? true : nil
            }
        
        ///
        try await 7
            .assertMap(transform)
            .assertTrue()
        
        ///
        await expectError {
            _ = try await 6.assertMap(transform)
        }
    }
}

///
extension Testable_tests {
    
    ///
    func test_assert_condition () throws {
        try 9.assert(condition: { $0 == 9 })
        try 9.assert(
            condition: {
                if $0 != 9 { throw ErrorMessage.blank }
                return true
            }
        )
    }
}

/// extension Testable where Self: Equatable
extension Testable_tests {
    
    ///
    func test_assertEqual_to () throws {
        try "hello"
            .assertEqual(to: "hello")
        
        expectError {
            try 9.assertEqual(to: 8)
        }
    }
    
    ///
    func test_assertEqualTo () throws {
        try ["1", "2", "3"].assertEqualTo {
            ["1", "2", "3"]
        }
    }
    
    ///
    func test_assertNotEqual_to () throws {
        try "hola"
            .assertNotEqual(to: "hello")
        
        expectError {
            try true.assertNotEqual(to: true)
        }
    }
}

///
extension Testable_tests {
    
    ///
    func test_assertGreater_than () throws {
        try 2.assertGreater(than: 1)
        try 1.assertGreater(than: 0)
        try 0.assertGreater(than: -1)
        try 7.assertGreater(than: -100)
        try (-99).assertGreater(than: -100)
        expectErrors(
            { try 2.assertGreater(than: 3) },
            { try 0.assertGreater(than: 0) },
            { try (-10).assertGreater(than: -10) }
        )
    }
    
    ///
    func test_assertGreaterThanOrEqual_to () throws {
        try 2.assertGreaterThanOrEqual(to: 1)
        try 1.assertGreaterThanOrEqual(to: 0)
        try 0.assertGreaterThanOrEqual(to: -1)
        try 7.assertGreaterThanOrEqual(to: -100)
        try (-99).assertGreaterThanOrEqual(to: -100)
        try 0.assertGreaterThanOrEqual(to: 0)
        try (-10).assertGreaterThanOrEqual(to: -10)
        expectError {
            try 2.assertGreaterThanOrEqual(to: 3)
        }
    }
    
    ///
    func test_assertLess_than () throws {
        try 1.assertLess(than: 2)
        try 0.assertLess(than: 1)
        try (-1).assertLess(than: 0)
        try (-100).assertLess(than: 7)
        try (-100).assertLess(than: -99)
        expectErrors(
            { try 3.assertLess(than: 2) },
            { try 0.assertLess(than: 0) },
            { try (-10).assertLess(than: -10) }
        )
    }
    
    ///
    func test_assertLessThanOrEqual_to () throws {
        try 1.assertLessThanOrEqual(to: 2)
        try 0.assertLessThanOrEqual(to: 1)
        try (-1).assertLessThanOrEqual(to: 0)
        try (-100).assertLessThanOrEqual(to: 7)
        try (-100).assertLessThanOrEqual(to: -99)
        try 0.assertLessThanOrEqual(to: 0)
        try (-10).assertLessThanOrEqual(to: -10)
        expectError {
            try 3.assertLessThanOrEqual(to: 2)
        }
    }
}
