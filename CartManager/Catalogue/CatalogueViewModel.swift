//
//  CatalogueViewModel.swift
//  CartManager
//
//  Created by Vlad Boguzh on 31.08.2024.
//

import Foundation

@MainActor
@Observable
final class CatalogueViewModel {

    private(set) var products: [Product] = []

    let cartManager: CartManager
    
    init(cartManager: CartManager) {
        self.cartManager = cartManager
    }

    func onAppear() {
        products = Product.samples
    }
}
