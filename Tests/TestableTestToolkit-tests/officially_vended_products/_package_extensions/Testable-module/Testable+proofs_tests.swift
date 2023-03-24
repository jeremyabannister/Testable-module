//
//  Testable+proofs_tests.swift
//  
//
//  Created by Jeremy Bannister on 3/24/23.
//

///
extension Testable_tests {
    
    ///
    func test_Testable_proof () {
        func imagine <T: Testable> (t: T) {
            t.proof_Testable()
            T.proof_Testable()
        }
    }
}
