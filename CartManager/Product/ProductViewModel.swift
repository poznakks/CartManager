//
//  ProductViewModel.swift
//  CartManager
//
//  Created by Vlad Boguzh on 01.09.2024.
//

import Foundation
import Combine

@MainActor
@Observable
final class ProductViewModel {

    let product: Product
    private(set) var quantityInCart: Int = 0

    private let cartManager: CartManager
    @ObservationIgnored
    private var cancellables: Set<AnyCancellable> = []

    init(product: Product, cartManager: CartManager) {
        self.product = product
        self.cartManager = cartManager
        cartManager.$cartItems
            .receive(on: DispatchQueue.main)
            .map { $0[product] ?? 0 }
            .sink { [weak self] quantity in
                self?.quantityInCart = quantity
            }
            .store(in: &cancellables)
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
