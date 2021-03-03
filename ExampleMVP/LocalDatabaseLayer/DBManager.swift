//
//  DBManager.swift
//  ExampleMVP
//
//  Created by EgorErmin on 03.03.2021.
//

import Foundation

final class DBManager {
    
    static let shared: DBManager = { return DBManager() }()
    
    private init() { }
    
    func setUser(login: String, password: String) {
        UserDefaults.standard.setValue(password, forKey: login)
    }
    
    func checkUser(login: String, password: String) -> Bool {
        if UserDefaults.standard.string(forKey: login) == password {
            return true
        } else {
            return false
        }
    }
    
}
