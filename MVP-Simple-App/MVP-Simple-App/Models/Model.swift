//
//  Model.swift
//  MVP-Simple-App
//
//  Created by 木元健太郎 on 2021/09/25.
//

import Foundation

struct SampleItem {
    let title: String

    static func createItems() -> [SampleItem] {
        let items = [
            SampleItem(title: "りんご"),
            SampleItem(title: "バナナ"),
            SampleItem(title: "オレンジ"),
            SampleItem(title: "ぶどう"),
            SampleItem(title: "キウイ")
        ]
        return items
    }
}
