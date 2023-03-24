//
//  Foundation+Testable_tests.swift
//  
//
//  Created by Jeremy Bannister on 3/23/23.
//

///
fileprivate final class TestFoundationTestableConformances: XCTestCase {
    
    ///
    func test () {
        Array<Double>.proof_Testable()
        Bool.proof_Testable()
        ClosedRange<Date>.proof_Testable()
        Data.proof_Testable()
        Date.proof_Testable()
        DateFormatter.proof_Testable()
        Dictionary<String, Bool>.proof_Testable()
        Dictionary<Bool, Int>.Keys.proof_Testable()
        Dictionary<String, Bool>.Values.proof_Testable()
        Double.proof_Testable()
        Int.proof_Testable()
        JSONDecoder.proof_Testable()
        JSONEncoder.proof_Testable()
        Optional<Bool>.proof_Testable()
        Result<Int, ErrorMessage>.proof_Testable()
        Set<String>.proof_Testable()
        String.proof_Testable()
        UInt.proof_Testable()
        URL.proof_Testable()
        URLComponents.proof_Testable()
        URLRequest.proof_Testable()
        UUID.proof_Testable()
    }
}
