//
//  Product.swift
//  CartManager
//
//  Created by Vlad Boguzh on 30.08.2024.
//

import Foundation
import Collections

struct Product: Codable, Identifiable {
    let id: UUID
    let name: String
    let price: Int

    private static let iphone15ProUUID = UUID(uuidString: "E8B3E1C4-03E4-4D74-9A24-CA4A39F27829")!
    private static let galaxyS23UUID = UUID(uuidString: "7D99494D-5D4B-49D4-88F5-B0E0E9DDECB4")!

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
        Array(predefinedProducts.values)
    }

    private static let predefinedProducts: OrderedDictionary = [
        iphone15ProUUID: Product(id: UUID(uuidString: "E8B3E1C4-03E4-4D74-9A24-CA4A39F27829")!, name: "iPhone 15 Pro", price: 1000),
        galaxyS23UUID: Product(id: UUID(uuidString: "7D99494D-5D4B-49D4-88F5-B0E0E9DDECB4")!, name: "Samsung Galaxy S23", price: 950),
        UUID(uuidString: "A03A558F-CB6B-45F6-824D-739F44102D10")!: Product(id: UUID(uuidString: "A03A558F-CB6B-45F6-824D-739F44102D10")!, name: "Google Pixel 8", price: 899),
        UUID(uuidString: "1A36671E-0580-4214-8BE3-EB1FA99F6B13")!: Product(id: UUID(uuidString: "1A36671E-0580-4214-8BE3-EB1FA99F6B13")!, name: "OnePlus 11", price: 799),
        UUID(uuidString: "9D58160E-FB8F-455B-B35D-F0C4E7BB7496")!: Product(id: UUID(uuidString: "9D58160E-FB8F-455B-B35D-F0C4E7BB7496")!, name: "Xiaomi Mi 13", price: 699),
        UUID(uuidString: "EDABE7F3-972B-46A9-BF11-8989D3F0B1B7")!: Product(id: UUID(uuidString: "EDABE7F3-972B-46A9-BF11-8989D3F0B1B7")!, name: "Sony Xperia 5 V", price: 950),
        UUID(uuidString: "E1EAFEF2-90C9-4032-BF42-13F2799E89C4")!: Product(id: UUID(uuidString: "E1EAFEF2-90C9-4032-BF42-13F2799E89C4")!, name: "Huawei Mate 50", price: 1050),
        UUID(uuidString: "67445A50-0A5A-44E7-B709-B2E1F03612F7")!: Product(id: UUID(uuidString: "67445A50-0A5A-44E7-B709-B2E1F03612F7")!, name: "Motorola Edge 40", price: 699),
        UUID(uuidString: "672EA6D2-B61C-4F21-86B0-A5176A3E3A5A")!: Product(id: UUID(uuidString: "672EA6D2-B61C-4F21-86B0-A5176A3E3A5A")!, name: "Asus ROG Phone 7", price: 1199),
        UUID(uuidString: "AF79105C-3A0A-4893-BF45-9AE676C72F9B")!: Product(id: UUID(uuidString: "AF79105C-3A0A-4893-BF45-9AE676C72F9B")!, name: "Nokia X30", price: 649),
        UUID(uuidString: "C4E2D73E-A646-45AC-A093-4E759D85C6A1")!: Product(id: UUID(uuidString: "C4E2D73E-A646-45AC-A093-4E759D85C6A1")!, name: "Google Pixel 8 Pro", price: 999),
        UUID(uuidString: "C31AAFA8-2A37-499E-9CEB-9EC6DBF792D8")!: Product(id: UUID(uuidString: "C31AAFA8-2A37-499E-9CEB-9EC6DBF792D8")!, name: "Apple MacBook Air M2", price: 1200),
        UUID(uuidString: "69C8262C-47C3-4D91-98A6-6B1F7508928F")!: Product(id: UUID(uuidString: "69C8262C-47C3-4D91-98A6-6B1F7508928F")!, name: "Dell XPS 13", price: 1400),
        UUID(uuidString: "F58D8262-54FB-42A0-A69B-0FF68F4730E6")!: Product(id: UUID(uuidString: "F58D8262-54FB-42A0-A69B-0FF68F4730E6")!, name: "Microsoft Surface Laptop 5", price: 1500),
        UUID(uuidString: "A09E8F9F-AF41-463E-B752-7DBB7B25E808")!: Product(id: UUID(uuidString: "A09E8F9F-AF41-463E-B752-7DBB7B25E808")!, name: "HP Spectre x360", price: 1350),
        UUID(uuidString: "D00B80D1-8882-4AF4-82C1-CFDF080DA07B")!: Product(id: UUID(uuidString: "D00B80D1-8882-4AF4-82C1-CFDF080DA07B")!, name: "Lenovo ThinkPad X1", price: 1600),
        UUID(uuidString: "8B8DB417-50EF-4030-BBB3-1D9DFA94D179")!: Product(id: UUID(uuidString: "8B8DB417-50EF-4030-BBB3-1D9DFA94D179")!, name: "Asus ZenBook 14", price: 1100),
        UUID(uuidString: "39B5C678-FA54-4B0B-98F7-F0B21FCA3C34")!: Product(id: UUID(uuidString: "39B5C678-FA54-4B0B-98F7-F0B21FCA3C34")!, name: "Razer Blade 15", price: 2500),
        UUID(uuidString: "204D3A6F-F1FB-42AD-B1A0-BD74D82B6844")!: Product(id: UUID(uuidString: "204D3A6F-F1FB-42AD-B1A0-BD74D82B6844")!, name: "MSI GS66 Stealth", price: 2300),
        UUID(uuidString: "AABB54A1-0F47-46E9-960E-B9734BA8F679")!: Product(id: UUID(uuidString: "AABB54A1-0F47-46E9-960E-B9734BA8F679")!, name: "Acer Predator Helios 300", price: 1500),
        UUID(uuidString: "4B1050F9-A08B-4E76-85B7-F9350C0578A6")!: Product(id: UUID(uuidString: "4B1050F9-A08B-4E76-85B7-F9350C0578A6")!, name: "Samsung Galaxy Tab S9", price: 800),
        UUID(uuidString: "7A8C1427-C25B-4C22-8C68-48AA83C03A76")!: Product(id: UUID(uuidString: "7A8C1427-C25B-4C22-8C68-48AA83C03A76")!, name: "Apple iPad Pro", price: 1200),
        UUID(uuidString: "B8451C30-BDF3-4C0C-9364-C97344E8E60C")!: Product(id: UUID(uuidString: "B8451C30-BDF3-4C0C-9364-C97344E8E60C")!, name: "Microsoft Surface Pro 9", price: 999),
        UUID(uuidString: "DCEA2081-A41C-45A6-9813-95A2AB23F77C")!: Product(id: UUID(uuidString: "DCEA2081-A41C-45A6-9813-95A2AB23F77C")!, name: "Amazon Kindle Oasis", price: 299),
        UUID(uuidString: "C12F452B-E411-42B2-90F5-2A6A43F2AD94")!: Product(id: UUID(uuidString: "C12F452B-E411-42B2-90F5-2A6A43F2AD94")!, name: "Sony WH-1000XM5 Headphones", price: 399),
        UUID(uuidString: "B5F7D438-6476-4D44-A9F5-ED4E1AE7FA8E")!: Product(id: UUID(uuidString: "B5F7D438-6476-4D44-A9F5-ED4E1AE7FA8E")!, name: "Bose QuietComfort 45", price: 349),
        UUID(uuidString: "53EDC5F5-F3DB-49B9-B5F4-655946A7705C")!: Product(id: UUID(uuidString: "53EDC5F5-F3DB-49B9-B5F4-655946A7705C")!, name: "Apple AirPods Pro 2", price: 249),
        UUID(uuidString: "D543F6A5-3A8C-4C56-A983-CE7DF598D55C")!: Product(id: UUID(uuidString: "D543F6A5-3A8C-4C56-A983-CE7DF598D55C")!, name: "Samsung Galaxy Buds 2 Pro", price: 199),
        UUID(uuidString: "FEAE8A90-1472-42E8-BA6D-0D165E6B6E92")!: Product(id: UUID(uuidString: "FEAE8A90-1472-42E8-BA6D-0D165E6B6E92")!, name: "Jabra Elite 85t", price: 229),
        UUID(uuidString: "6694E18D-AF1A-4606-A65C-A4EBF033FC85")!: Product(id: UUID(uuidString: "6694E18D-AF1A-4606-A65C-A4EBF033FC85")!, name: "Beats Studio Buds", price: 149),
        UUID(uuidString: "8CFEDAB3-B13E-4211-B1C3-066FE64DF2B7")!: Product(id: UUID(uuidString: "8CFEDAB3-B13E-4211-B1C3-066FE64DF2B7")!, name: "Sony WF-1000XM4", price: 279),
        UUID(uuidString: "3E6C95F1-758E-47F4-AB5C-C027E7761180")!: Product(id: UUID(uuidString: "3E6C95F1-758E-47F4-AB5C-C027E7761180")!, name: "Apple Watch Series 9", price: 429),
        UUID(uuidString: "D69E2C02-905E-4B6D-AB58-6B37068E0E18")!: Product(id: UUID(uuidString: "D69E2C02-905E-4B6D-AB58-6B37068E0E18")!, name: "Garmin Fenix 7", price: 899),
        UUID(uuidString: "D90D5872-C07B-42FA-87F1-81FB6D78959C")!: Product(id: UUID(uuidString: "D90D5872-C07B-42FA-87F1-81FB6D78959C")!, name: "Fitbit Charge 6", price: 199),
        UUID(uuidString: "D022B06E-9674-49B4-A351-F2C1A7F8E1A7")!: Product(id: UUID(uuidString: "D022B06E-9674-49B4-A351-F2C1A7F8E1A7")!, name: "Oculus Quest 3", price: 499),
        UUID(uuidString: "18D8A324-611B-46B3-A8EF-06EBF70B2B23")!: Product(id: UUID(uuidString: "18D8A324-611B-46B3-A8EF-06EBF70B2B23")!, name: "PlayStation 5", price: 499),
        UUID(uuidString: "2A479DFF-DB35-4FE7-B340-C8DC67F5C4DA")!: Product(id: UUID(uuidString: "2A479DFF-DB35-4FE7-B340-C8DC67F5C4DA")!, name: "Xbox Series X", price: 499),
        UUID(uuidString: "05B92D7E-5E0E-4D15-83D4-7BD6EBA060BB")!: Product(id: UUID(uuidString: "05B92D7E-5E0E-4D15-83D4-7BD6EBA060BB")!, name: "Nintendo Switch OLED", price: 349),
        UUID(uuidString: "0F989C37-77CF-4966-90A4-6543D2B17AA5")!: Product(id: UUID(uuidString: "0F989C37-77CF-4966-90A4-6543D2B17AA5")!, name: "DJI Mavic Air 2", price: 999),
        UUID(uuidString: "0FC7F5B8-0711-4210-9B38-101726F983A9")!: Product(id: UUID(uuidString: "0FC7F5B8-0711-4210-9B38-101726F983A9")!, name: "GoPro Hero 12", price: 449)
    ]
}

extension Product: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func ==(lhs: Product, rhs: Product) -> Bool {
        lhs.id == rhs.id
    }
}
