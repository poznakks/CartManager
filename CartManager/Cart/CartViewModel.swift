//
//  CartViewModel.swift
//  CartManager
//
//  Created by Vlad Boguzh on 31.08.2024.
//

import Foundation
import Combine

@MainActor
final class CartViewModel: ObservableObject {

    @Published private(set) var products: [Product] = []

    let cartManager: CartManager
    private var cancellables: Set<AnyCancellable> = []

    init(cartManager: CartManager) {
        self.cartManager = cartManager
        cartManager.$cartItems
            .receive(on: DispatchQueue.main)
            .sink { [weak self] updatedCartItems in
                self?.products = updatedCartItems.keys.elements
            }
            .store(in: &cancellables)
    }

    func onAppear() {
        // implement some logic
    }
}
