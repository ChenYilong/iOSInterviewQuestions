//
//  RequestError.swift
//  Defined some network errors.
//
//  Created by Jacklandrin on 2023/8/7.
//

import Foundation

public enum RequestError: Error {
    case operationCancelled
    case requestFailed(error: Error)
    case unknownStatusCode
    case unexpectedStatusCode(code: Int)
    case contentEmptyData
    case contentDecoding(error: Error)
}

extension RequestError: CustomStringConvertible {

    public var description: String {
        switch self {
            case .operationCancelled:
                return "Operation was cancelled"
            case let .requestFailed(error):
                return "Request failed with \(error)"
            case .unknownStatusCode:
                return "The status code is unknown"
            case let .unexpectedStatusCode(error):
                return "The status code is unexpected \(error)"
            case .contentEmptyData:
                return "The contyent data is empty"
            case let .contentDecoding(error):
                return "Error while decoding with \(error)"
        }
    }
}
