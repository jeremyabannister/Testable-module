//
//  Bool+extensions_tests.swift
//  
//
//  Created by Jeremy Bannister on 3/23/23.
//

///
extension Testable_tests {
    
    ///
    func test_assertTrue_where_Bool () throws {
        
        /// Test type
        let _: ()throws->Bool = true.assertTrue
        
        /// Test that returns true when true
        try (try? true.assertTrue())
            .assertEqual(to: true)
        
        /// Test that blows up when false
        do {
            let _ = try false.assertTrue()
            XCTFail()
        } catch { }
    }
    
    ///
    func test_assertFalse_where_Bool () throws {
        
        /// Test type
        let _: ()throws->Bool = true.assertFalse
        
        /// Test that returns false when false
        try (try? false.assertFalse())
            .assertEqual(to: false)
        
        /// Test that blows up when true
        do {
            let _ = try true.assertFalse()
            XCTFail()
        } catch { }
    }
}
