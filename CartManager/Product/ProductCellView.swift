//
//  ProductCellView.swift
//  CartManager
//
//  Created by Vlad Boguzh on 01.09.2024.
//

import SwiftUI

struct ProductCellView: View {

    var viewModel: ProductViewModel

    var body: some View {
        VStack(spacing: 10) {
            Text(viewModel.product.name)
                .font(.headline)
                .multilineTextAlignment(.center)
                .lineLimit(2, reservesSpace: true)
                .foregroundColor(.primary)

            Text("$\(viewModel.product.price)")
                .font(.subheadline)
                .foregroundColor(.secondary)

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
        }
        .padding()
        .background(Color(uiColor: .systemGray6))
        .cornerRadius(10)
    }
}

#Preview {
    ProductCellView(
        viewModel: ProductViewModel(
            product: .sample,
            cartManager: CartManager()
        )
    )
}
