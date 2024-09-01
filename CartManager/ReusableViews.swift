//
//  ReusableViews.swift
//  CartManager
//
//  Created by Vlad Boguzh on 31.08.2024.
//

import SwiftUI

struct ChangeQuantityButtons: View {

    let quantity: Int
    let disableMinusIfQuantityIsOne: Bool
    let onMinus: () -> Void
    let onPlus: () -> Void

    private var isMinusButtonDisabled: Bool {
        quantity == 1 && disableMinusIfQuantityIsOne
    }

    init(
        quantity: Int,
        disableMinusIfQuantityIsOne: Bool = false,
        onMinus: @escaping () -> Void,
        onPlus: @escaping () -> Void
    ) {
        self.quantity = quantity
        self.disableMinusIfQuantityIsOne = disableMinusIfQuantityIsOne
        self.onMinus = onMinus
        self.onPlus = onPlus
    }

    var body: some View {
        HStack {
            Button {
                if !isMinusButtonDisabled {
                    onMinus()
                }
            } label: {
                Text("-")
                    .font(.body)
                    .fontWeight(.bold)
                    .frame(width: 40, height: 40)
                    .background(isMinusButtonDisabled ? Color.gray : Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .buttonStyle(PlainButtonStyle())
            .opacity(isMinusButtonDisabled ? 0.5 : 1)

            Spacer()

            Text(String(quantity))
                .font(.body)
                .fontWeight(.bold)
                .padding(.horizontal, 10)

            Spacer()

            Button(action: onPlus) {
                Text("+")
                    .font(.body)
                    .fontWeight(.bold)
                    .frame(width: 40, height: 40)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .buttonStyle(PlainButtonStyle())
        }
        .frame(maxWidth: .infinity, maxHeight: 40)
    }
}

struct AddToCartButton: View {

    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text("Add to Cart")
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, minHeight: 40)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
        .buttonStyle(PlainButtonStyle())
        .frame(maxWidth: .infinity, maxHeight: 40)
    }
}

struct RemoveFromCartButton: View {

    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(systemName: "trash")
                .font(.system(size: 20))
                .frame(width: 40, height: 40)
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
        .buttonStyle(PlainButtonStyle())
    }
}
