//
//  CartManager.swift
//  CartManager
//
//  Created by Vlad Boguzh on 30.08.2024.
//

import Foundation
import Collections

@MainActor
final class CartManager: ObservableObject {
    
    @Published private(set) var cartItems: OrderedDictionary<Product, Int> = [:]
    @Published private(set) var totalInCart: Int = 0

    private let cartService: CartServiceProtocol

    init(cartService: CartServiceProtocol = CartService()) {
        self.cartService = cartService
        fetchCart()
    }

    func addProductToCart(_ product: Product) {
        totalInCart += 1
        cartItems[product] = 1
        syncWithServer(product: product, request: .add)
    }
    
    func removeProductFromCart(_ product: Product) {
        totalInCart -= cartItems[product, default: 0]
        cartItems[product] = nil
        syncWithServer(product: product, request: .remove)
    }
    
    func increaseProductInCart(_ product: Product) {
        totalInCart += 1
        cartItems[product, default: 0] += 1
        syncWithServer(product: product, request: .increase)
    }
    
    func decreaseProductInCart(_ product: Product) {
        if cartItems[product, default: 0] > 1 {
            totalInCart -= 1
            cartItems[product, default: 0] -= 1
            syncWithServer(product: product, request: .decrease)
        } else {
            removeProductFromCart(product)
        }
    }

    private func fetchCart() {
        Task {
//            try await Task.sleep(for: .seconds(3))
            let cartItems = try await cartService.fetchCart()
            let totalInCart = cartItems.values.reduce(0, +)
            self.cartItems = cartItems
            self.totalInCart = totalInCart
        }
    }

    private func syncWithServer(product: Product, request: Request) {
        Task {
            do {
                switch request {
                case .add:
                    try await cartService.addProductToCart(product)
                case .remove:
                    try await cartService.removeProductFromCart(product)
                case .increase:
                    try await cartService.increaseProductInCart(product)
                case .decrease:
                    try await cartService.decreaseProductInCart(product)
                }
            } catch {
                print(error)
            }
        }
    }

    private enum Request {
        case add
        case remove
        case increase
        case decrease
    }
}
