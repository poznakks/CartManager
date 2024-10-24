//
//  CatalogueView.swift
//  CartManager
//
//  Created by Vlad Boguzh on 31.08.2024.
//

import SwiftUI

struct CatalogueView: View {

    let viewModel: CatalogueViewModel

    private let columns = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10)
    ]

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(viewModel.products) { product in
                        let productViewModel = viewModel.productViewModel(for: product)

                        NavigationLink {
                            ProductDetailView(viewModel: productViewModel)
                        } label: {
                            ProductCellView(viewModel: productViewModel)
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
