//
//  NetworkEnviroment.swift
//  Defined Http header keys, methods and mimeType.
//
//  Created by Jacklandrin on 2023/8/7.
//

import Foundation

public enum NetworkEnvironment {
    public static let successStatusCodeRange: Range<Int> = 200 ..< 300
    public static let requestDefaultTimeout: TimeInterval = 60
}

public enum HttpHeaderKey {
    public static let contentType = "Content-Type"
    public static let acceptLanguage = "Accept-Language"
    public static let contentLength = "Content-Length"
    public static let contentDisposition = "Content-Disposition"
    public static let accept = "Accept"
    public static let authorization = "Authorization"
}

public enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
    case patch = "PATCH"
    case delete = "DELETE"
    case connect = "CONNECT"
    case head = "HEAD"
    case options = "OPTIONS"
    case put = "PUT"
    case trace = "TRACE"
}

public enum MimeType: String {
    case json = "application/json"
    case plain = "text/plain"
    case javascript = "text/javascript"
    case gif = "image/gif"
    case png = "image/png"
    case jpg = "image/jpg"
    case jpeg = "image/jpeg"
    case svg = "image/svg"
    case multipart = "multipart/form-data"
    case urlEncoded = "application/x-www-form-urlencoded"
}
