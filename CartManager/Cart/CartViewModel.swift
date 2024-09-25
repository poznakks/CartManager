//
//  CartViewModel.swift
//  CartManager
//
//  Created by Vlad Boguzh on 31.08.2024.
//

import Foundation
import Combine

@MainActor
@Observable
final class CartViewModel {

    private(set) var products: [Product] = []

    @ObservationIgnored
    private var productViewModels: [Product: ProductViewModel] = [:]

    private let cartManager: CartManager

    @ObservationIgnored
    private var cancellables: Set<AnyCancellable> = []

    init(cartManager: CartManager) {
        self.cartManager = cartManager
        cartManager.$cartItems
            .receive(on: DispatchQueue.main)
            .sink { [weak self] updatedCartItems in
                self?.products = updatedCartItems.keys.elements
            }
            .store(in: &cancellables)
        print("created CartViewModel")
    }

    func productViewModel(for product: Product) -> ProductViewModel {
        if let viewModel = productViewModels[product] {
            return viewModel
        } else {
            let newViewModel = ProductViewModel(product: product, cartManager: cartManager)
            productViewModels[product] = newViewModel
            return newViewModel
        }
    }

    func onAppear() {
        // implement some logic
    }
}
