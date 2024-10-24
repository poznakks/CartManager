//
//  Observable+observe.swift
//  CartManager
//
//  Created by Vlad Boguzh on 24.10.2024.
//

import Foundation

extension Observable {
    func observe<T>(
        _ keyPath: KeyPath<Self, T>,
        onChange: @MainActor @escaping (T) -> Void
    ) where Self: AnyObject, Self: Sendable, T: Sendable {
        _ = withObservationTracking {
            self[keyPath: keyPath]
        } onChange: { [weak self] in
            DispatchQueue.main.async {
                guard let self else { return }
                onChange(self[keyPath: keyPath])
                // Re-register to continue observing changes
                self.observe(keyPath, onChange: onChange)
            }
        }
    }
}

extension KeyPath: @unchecked Swift.Sendable where Root: Sendable, Value: Sendable {}
