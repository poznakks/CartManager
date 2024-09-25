//
//  ProductInCartCellView.swift
//  CartManager
//
//  Created by Vlad Boguzh on 01.09.2024.
//

import SwiftUI

struct ProductInCartCellView: View {

    var viewModel: ProductViewModel
    @State private var showingRemoveAlert = false

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text(viewModel.product.name)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.primary)
                Text("$\(viewModel.product.price)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

//            let _ = print("\(viewModel.product) \(viewModel.quantityInCart)")

            RemoveFromCartButton {
                showingRemoveAlert = true
            }

            let quantity = viewModel.quantityInCart
            ChangeQuantityButtons(
                quantity: quantity,
                disableMinusIfQuantityIsOne: true
            ) {
                viewModel.decreaseProductInCart()
            } onPlus: {
                viewModel.increaseProductInCart()
            }
        }
        .padding()
        .background(Color(uiColor: .systemGray6))
        .cornerRadius(10)
        .actionSheet(isPresented: $showingRemoveAlert) {
            ActionSheet(
                title: Text("Are you sure you want to remove this item from your cart?"),
                buttons: [
                    .destructive(Text("Remove")) {
                        viewModel.removeProductFromCart()
                    },
                    .cancel()
                ]
            )
        }
    }
}

#Preview {
    ProductInCartCellView(
        viewModel: ProductViewModel(
            product: .sample,
            cartManager: CartManager()
        )
    )
}

