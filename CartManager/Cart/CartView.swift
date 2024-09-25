//
//  CartView.swift
//  CartManager
//
//  Created by Vlad Boguzh on 31.08.2024.
//

import SwiftUI

struct CartView: View {

    @State var viewModel: CartViewModel

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 10) {
                    ForEach(viewModel.products) { product in
                        NavigationLink {
                            ProductDetailView(
                                viewModel: ProductViewModel(
                                    product: product,
                                    cartManager: viewModel.cartManager
                                )
                            )
                        } label: {
                            ProductInCartCellView(
                                viewModel: ProductViewModel(
                                    product: product,
                                    cartManager: viewModel.cartManager
                                )
                            )
                        }

                    }
                }
                .padding(10)
            }
            .background(Color(uiColor: .systemBackground))
            .navigationTitle("Cart")
            .onAppear {
                viewModel.onAppear()
            }
        }
    }
}

#Preview {
    let cartManager = CartManager()
    return CartView(
        viewModel: CartViewModel(cartManager: cartManager)
    )
}
