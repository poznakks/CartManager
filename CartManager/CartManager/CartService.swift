//
//  CartService.swift
//  CartManager
//
//  Created by Vlad Boguzh on 30.08.2024.
//

import Foundation
import Collections

protocol CartServiceProtocol: Sendable {
    func fetchCart() async throws -> OrderedDictionary<Product, Int>
    func addProductToCart(_ product: Product) async throws
    func removeProductFromCart(_ product: Product) async throws
    func increaseProductInCart(_ product: Product) async throws
    func decreaseProductInCart(_ product: Product) async throws
}

final class CartService: CartServiceProtocol {

    private let networkClient: NetworkClientProtocol

    init(networkClient: NetworkClientProtocol = NetworkClient()) {
        self.networkClient = networkClient
    }

    func fetchCart() async throws -> OrderedDictionary<Product, Int> {
        try await networkClient.send("fetching cart")
        return OrderedDictionary(uniqueKeysWithValues: Product.samplesInCart)
    }

    func addProductToCart(_ product: Product) async throws {
        try await networkClient.send(product.name + " added to cart")
    }
    
    func removeProductFromCart(_ product: Product) async throws {
        try await networkClient.send(product.name + " removed from cart")
    }
    
    func increaseProductInCart(_ product: Product) async throws {
        try await networkClient.send(product.name + " increased in cart")
    }
    
    func decreaseProductInCart(_ product: Product) async throws {
        try await networkClient.send(product.name + " decreased in cart")
    }
}
