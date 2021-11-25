//
//  LoginService.swift
//  CVCreatorCore
//
//  Created by Nathan on 25/11/2021.
//

import Foundation

protocol AuthenticationServiceProtocol {
    func login(username: String, password: String) async throws -> Bool
    func signUp()
    func logout()
    func resetPassword()
    func deleteAccount()
}

class AuthenticationService: AuthenticationServiceProtocol {
    enum Error: Swift.Error {
        case usernameIsTooShort
        case passwordIsEmpty
        case serverFailedToValidateLoginInformation
    }
    
    init(networkManager: NetworkManager = .shared) {
        self.networkManager = networkManager
    }

    

    func login(username: String, password: String) async throws -> Bool {
        
        guard username.count >= 8 else {
            throw Error.usernameIsTooShort
        }
        
        guard !password.isEmpty else {
            throw Error.passwordIsEmpty
        }
        
        
        let loginEndpointUrl = URL(string: "www.cvcreator.com/api/v1/login")!
        
        
        guard let loginResponse: LoginResponse = try? await networkManager.send(url: loginEndpointUrl) else {
            throw Error.serverFailedToValidateLoginInformation
        }
        
        return loginResponse.isSuccess

    }
    
    func signUp() {
        
    }
    
    func logout() {
        
    }
    
    func resetPassword() {
        
    }
    
    func deleteAccount() {
        
    }
    
    
    static let shared = AuthenticationService()
    
    
    private let networkManager: NetworkManager
    
}
