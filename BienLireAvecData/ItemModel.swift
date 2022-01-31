//
//  ItemModel.swift
//  BienLireAvecData
//
//  Created by sawako barberon on 02/01/2022.
//

import Foundation

struct ItemModel: Identifiable{
    let id: String =  UUID().uuidString
    let lemot: String
    let legroupe: String
    let leson: String
}
