//
//  Product.swift
//  CartManager
//
//  Created by Vlad Boguzh on 30.08.2024.
//

import Foundation

struct Product: Codable, Identifiable {
    let id: UUID
    let name: String
    let price: Int

    private static let iphone15ProUUID = UUID()
    private static let galaxyS23UUID = UUID()

    static var sample: Product {
        Product(id: iphone15ProUUID, name: "iPhone 15 Pro", price: 999)
    }

    static var samplesInCart: [(Product, Int)] {
        [
            (Product(id: iphone15ProUUID, name: "iPhone 15 Pro", price: 1000), 1),
            (Product(id: galaxyS23UUID, name: "Samsung Galaxy S23", price: 950), 3)
        ]
    }

    static var samples: [Product] {
        [
            Product(id: iphone15ProUUID, name: "iPhone 15 Pro", price: 1000),
            Product(id: galaxyS23UUID, name: "Samsung Galaxy S23", price: 950),
            Product(id: UUID(), name: "Google Pixel 8", price: 899),
            Product(id: UUID(), name: "OnePlus 11", price: 799),
            Product(id: UUID(), name: "Xiaomi Mi 13", price: 699),
            Product(id: UUID(), name: "Sony Xperia 5 V", price: 950),
            Product(id: UUID(), name: "Huawei Mate 50", price: 1050),
            Product(id: UUID(), name: "Motorola Edge 40", price: 699),
            Product(id: UUID(), name: "Asus ROG Phone 7", price: 1199),
            Product(id: UUID(), name: "Nokia X30", price: 649),
            Product(id: UUID(), name: "Google Pixel 8 Pro", price: 999),
            Product(id: UUID(), name: "Apple MacBook Air M2", price: 1200),
            Product(id: UUID(), name: "Dell XPS 13", price: 1400),
            Product(id: UUID(), name: "Microsoft Surface Laptop 5", price: 1500),
            Product(id: UUID(), name: "HP Spectre x360", price: 1350),
            Product(id: UUID(), name: "Lenovo ThinkPad X1", price: 1600),
            Product(id: UUID(), name: "Asus ZenBook 14", price: 1100),
            Product(id: UUID(), name: "Razer Blade 15", price: 2500),
            Product(id: UUID(), name: "MSI GS66 Stealth", price: 2300),
            Product(id: UUID(), name: "Acer Predator Helios 300", price: 1500),
            Product(id: UUID(), name: "Samsung Galaxy Tab S9", price: 800),
            Product(id: UUID(), name: "Apple iPad Pro", price: 1200),
            Product(id: UUID(), name: "Microsoft Surface Pro 9", price: 999),
            Product(id: UUID(), name: "Amazon Kindle Oasis", price: 299),
            Product(id: UUID(), name: "Sony WH-1000XM5 Headphones", price: 399),
            Product(id: UUID(), name: "Bose QuietComfort 45", price: 349),
            Product(id: UUID(), name: "Apple AirPods Pro 2", price: 249),
            Product(id: UUID(), name: "Samsung Galaxy Buds 2 Pro", price: 199),
            Product(id: UUID(), name: "Jabra Elite 85t", price: 229),
            Product(id: UUID(), name: "Beats Studio Buds", price: 149),
            Product(id: UUID(), name: "Sony WF-1000XM4", price: 279),
            Product(id: UUID(), name: "Apple Watch Series 9", price: 429),
            Product(id: UUID(), name: "Garmin Fenix 7", price: 899),
            Product(id: UUID(), name: "Fitbit Charge 6", price: 199),
            Product(id: UUID(), name: "Oculus Quest 3", price: 499),
            Product(id: UUID(), name: "PlayStation 5", price: 499),
            Product(id: UUID(), name: "Xbox Series X", price: 499),
            Product(id: UUID(), name: "Nintendo Switch OLED", price: 349),
            Product(id: UUID(), name: "DJI Mavic Air 2", price: 999),
            Product(id: UUID(), name: "GoPro Hero 12", price: 449)
        ]
    }
}

extension Product: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func ==(lhs: Product, rhs: Product) -> Bool {
        lhs.id == rhs.id
    }
}
