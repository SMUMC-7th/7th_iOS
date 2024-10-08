//
//  LoginModel.swift
//  kream
//
//  Created by 유시은 on 9/24/24.
//
import Foundation

// 기존 struct 모델
/*
struct LoginModel{
    let id : String
    let pwd : String
}
*/

class LoginUserDefaultsModel {
    private let loginUserDefaults = UserDefaults.standard
    
    private let userId: String = "userId"
    private let userPassword: String = "userPassword"
    
    // id 저장
    public func saveUserId(_ id: String) {
        loginUserDefaults.set(id, forKey: userId)
    }
    
    // password 저장
    public func saveUserPassword(_ password: String) {
        loginUserDefaults.set(password, forKey: userPassword)
    }
    
    // loginUserDefaults에 저장된 id 불러오기
    public func loadUserId() -> String? {
        return loginUserDefaults.string(forKey: userId)
    }
    
    // loginUserDefaults에 저장된 password 불러오기
    public func loadUserPassword() -> String? {
        return loginUserDefaults.string(forKey: userPassword)
    }
}
