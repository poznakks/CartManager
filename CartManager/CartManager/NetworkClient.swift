//
//  NetworkClient.swift
//  CartManager
//
//  Created by Vlad Boguzh on 30.08.2024.
//

import Foundation

protocol NetworkClientProtocol: Sendable {
    @discardableResult
    func send(_ request: String) async throws -> (Data, URLResponse)
}

final class NetworkClient: NetworkClientProtocol {
    func send(_ request: String) async throws -> (Data, URLResponse) {
        try await Task.sleep(for: .milliseconds(50))
        return (Data(), URLResponse())
    }
}
