//
//  User.swift
//  JacketStash
//
//  Created by Adam Yao on 10/9/22.
//

import SwiftUI

struct User: Identifiable, Hashable {
    
    var id: String
    
    var name: String
    var phoneNumber: String
    var secretKey: String
}

