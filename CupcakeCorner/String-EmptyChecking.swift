//
//  String-EmptyChecking.swift
//  CupcakeCorner
//
//  Created by Alexandre Talatinian on 27/07/2022.
//

import Foundation

extension String {
    var isReallyEmpty: Bool {
        self.trimmingCharacters(in: .whitespaces).isEmpty
    }
}
