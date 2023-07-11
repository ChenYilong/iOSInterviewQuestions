//
//  MockURLProtocol.swift
//  iOSTestTests
//
//  Created by chenyilong on 2023/7/2.
//

import XCTest

final class MockURLProtocol: URLProtocol {
    static var requestHandler: ((URLRequest) throws -> (HTTPURLResponse, Data?, Error?))?
    
    override class func canInit(with request: URLRequest) -> Bool {
        true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        request
    }
    
    override func startLoading() {
        guard let handler = MockURLProtocol.requestHandler else {
            let error = NSError(domain: "MockURLProtocol", code: 1, userInfo: [NSLocalizedDescriptionKey: "Request handler is missing"])
            client?.urlProtocol(self, didFailWithError: error)
            return
        }
        
        do {
            let (response, data, error) = try handler(request)
            
            if let error = error {
                client?.urlProtocol(self, didFailWithError: error)
                return
            }
            
            guard let responseData = data else {
                let error = NSError(domain: "MockURLProtocol", code: 2, userInfo: [NSLocalizedDescriptionKey: "Data is missing"])
                client?.urlProtocol(self, didFailWithError: error)
                return
            }
            
            client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
            client?.urlProtocol(self, didLoad: responseData)
            client?.urlProtocolDidFinishLoading(self)
        } catch {
            client?.urlProtocol(self, didFailWithError: error)
        }
    }
    
    override func stopLoading() {}
    
}
