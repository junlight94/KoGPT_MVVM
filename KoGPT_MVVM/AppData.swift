//
//  AppData.swift
//  KoGPT_MVVM
//
//  Created by Junyoung on 2023/03/19.
//

import Foundation

enum AppData {
    enum Key: String {
        case nickName
    }
    
    @UserDefault(key: Key.nickName.rawValue, defaultValue: "")
    static var nickName: String
    
    @propertyWrapper
    struct UserDefault<T> {
        private let key: String
        private let defaultValue: T
        
        init(key: String, defaultValue: T) {
            self.key = key
            self.defaultValue = defaultValue
        }
        
        var wrappedValue: T {
            get {
                return UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
            }
            set {
                UserDefaults.standard.set(newValue, forKey: key)
            }
        }
    }
}
