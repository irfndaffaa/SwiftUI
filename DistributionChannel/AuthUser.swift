//
//  AuthUser.swift
//  DistributionChannel
//
//  Created by Irfandio Daffa A on 10/09/20.
//  Copyright © 2020 Irfandio Daffa A. All rights reserved.
//

import Foundation

class AuthUser: ObservableObject {
    @Published var isLoggedIn: Bool = false
    
    //print any mistake while login
    @Published var isCorrect: Bool = true
}
