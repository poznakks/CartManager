//
//  ProductViewModel.swift
//  CartManager
//
//  Created by Vlad Boguzh on 01.09.2024.
//

import Foundation

@MainActor
@Observable
final class ProductViewModel {

    let product: Product
    private(set) var quantityInCart: Int

    private let cartManager: CartManager

    init(product: Product, cartManager: CartManager) {
        self.product = product
        self.cartManager = cartManager
        self.quantityInCart = cartManager.cartItems[product] ?? 0
        listenToCartItems()
    }

    private func listenToCartItems() {
        observe(\.cartManager.cartItems) { cartItems in
            self.quantityInCart = self.cartManager.cartItems[self.product] ?? 0
        }
    }

    func addProductToCart() {
        cartManager.addProductToCart(product)
    }

    func removeProductFromCart() {
        cartManager.removeProductFromCart(product)
    }

    func increaseProductInCart() {
        cartManager.increaseProductInCart(product)
    }

    func decreaseProductInCart() {
        cartManager.decreaseProductInCart(product)
    }
}
