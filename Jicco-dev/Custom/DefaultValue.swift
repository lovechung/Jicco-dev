//
//  DefaultValue.swift
//  Jicco-dev
//
//  Created by admin on 2022/3/2.
//

import Foundation

protocol DefaultValue {
    associatedtype Value: Decodable
    static var defaultValue: Value { get }
}

@propertyWrapper
struct Default<T: DefaultValue> {
    var wrappedValue: T.Value
}

extension Default: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        wrappedValue = (try? container.decode(T.Value.self)) ?? T.defaultValue
    }
}

extension KeyedDecodingContainer {
    func decode<T>(_ type: Default<T>.Type, forKey key: Key) throws -> Default<T> where T: DefaultValue {
        // 判断 key 缺失的情况，提供默认值
        (try decodeIfPresent(type, forKey: key)) ?? Default(wrappedValue: T.defaultValue)
    }
}

extension Int: DefaultValue {
    static var defaultValue = 0
    struct Unknown: DefaultValue {
        static var defaultValue = -1
    }
}

extension String: DefaultValue {
    static var defaultValue = ""
    struct Zero: DefaultValue {
        static var defaultValue = "0"
    }
}

extension Bool: DefaultValue {
    static var defaultValue = false
}

extension Array: DefaultValue where Element: Decodable {
    typealias Value = Array<Element>
    static var defaultValue: Array<Element> {
        return []
    }
}
