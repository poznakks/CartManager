//
//  CatalogueView.swift
//  CartManager
//
//  Created by Vlad Boguzh on 31.08.2024.
//

import SwiftUI

struct CatalogueView: View {

    @StateObject var viewModel: CatalogueViewModel

    private let columns = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10)
    ]

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(viewModel.products) { product in
                        NavigationLink {
                            ProductDetailView(
                                viewModel: ProductViewModel(
                                    product: product,
                                    cartManager: viewModel.cartManager
                                )
                            )
                        } label: {
                            ProductCellView(
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
            .navigationTitle("Catalogue")
            .background(Color(uiColor: .systemBackground))
            .onAppear {
                viewModel.onAppear()
            }
        }
    }
}

#Preview {
    CatalogueView(
        viewModel: CatalogueViewModel(cartManager: CartManager())
    )
}
