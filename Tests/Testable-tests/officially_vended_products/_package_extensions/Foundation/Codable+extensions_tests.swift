//
//  Codable+extensions_tests.swift
//  
//
//  Created by Jeremy Bannister on 3/23/23.
//

///
extension Testable_tests {
    
    ///
    func test_assertRoundTripCoding () throws {
        try 7.assertRoundTripCoding()
        try "test".assertRoundTripCoding()
        try true.assertRoundTripCoding()
        try SomeCodableType().assertRoundTripCoding()
        expectError {
            try BrokenCodableType().assertRoundTripCoding()
        }
    }
}

///
fileprivate struct
    SomeCodableType:
        Codable,
        Equatable,
        Testable {
    
    var foo: Int = 7
    var bar: String = "wrf7🔥é"
    var abc: [SomeCodableType] = Bool.random() ? [] : [.init()]
}

///
fileprivate struct
    BrokenCodableType:
        Codable,
        Equatable,
        Testable {
    
    var foo: Int = 7
    var bar: String = "wrf7🔥é"
    var abc: [SomeCodableType] = Bool.random() ? [] : [.init()]
    
    init () {}
    
    ///
    init (from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.foo = 0
        self.bar = try container.decode(String.self, forKey: .bar)
        self.abc = try container.decode([SomeCodableType].self, forKey: .abc)
    }
    
    enum CodingKeys: CodingKey {
        case foo
        case bar
        case abc
    }
    
    func encode (to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.foo, forKey: .foo)
        try container.encode(self.bar, forKey: .bar)
        try container.encode(self.abc, forKey: .abc)
    }
}
