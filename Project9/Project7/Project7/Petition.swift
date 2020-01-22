//
//  Petition.swift
//  Project7
//
//  Created by Volodymyr Klymenko on 2020-01-14.
//  Copyright © 2020 Volodymyr Klymenko. All rights reserved.
//

import Foundation

struct Petition: Codable {
    var title: String
    var body: String
    var signatureCount: Int
}
