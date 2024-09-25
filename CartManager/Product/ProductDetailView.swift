//
//  ProductDetailView.swift
//  CartManager
//
//  Created by Vlad Boguzh on 01.09.2024.
//

import SwiftUI

struct ProductDetailView: View {

    @State var viewModel: ProductViewModel

    var body: some View {
        VStack(spacing: 20) {
            Text(viewModel.product.name)
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("$\(viewModel.product.price)")
                .font(.title)
                .foregroundColor(.secondary)

//            let _ = print("\(viewModel.product) \(viewModel.quantityInCart)")

            let quantity = viewModel.quantityInCart
            if quantity > 0 {
                ChangeQuantityButtons(quantity: quantity) {
                    viewModel.decreaseProductInCart()
                } onPlus: {
                    viewModel.increaseProductInCart()
                }
                .padding(.top, 5)
            } else {
                AddToCartButton {
                    viewModel.addProductToCart()
                }
                .padding(.top, 5)
            }

            Spacer()
        }
        .padding()
    }
}

#Preview {
    ProductDetailView(
        viewModel: ProductViewModel(
            product: .sample,
            cartManager: CartManager()
        )
    )
}
