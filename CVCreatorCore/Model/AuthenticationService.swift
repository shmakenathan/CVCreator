//
//  LoginService.swift
//  CVCreatorCore
//
//  Created by Nathan on 25/11/2021.
//

import Foundation

protocol AuthenticationServiceProtocol {
    func login(username: String, password: String) async throws -> Bool
    func signUp(username: String, email: String, password: String) async throws -> Bool
//    func logout()
//    func resetPassword()
//    func deleteAccount()
}


actor AuthenticationService: AuthenticationServiceProtocol {
    
    func signUp(username: String, email: String, password: String) async throws -> Bool {
        try await Task.sleep(nanoseconds: 1_000_000_000)
        let urlRequest = try createSignUpUrlRequest(username: username, email: email, password: password)
   
        
        guard let response = try? await networkManager.send(urlRequest: urlRequest) else {
            throw Error.serverFailedToValidateSignUpInformation
        }
        
        return response.isSuccess
    }
    
    enum Error: Swift.Error {
        case usernameIsTooShort
        case passwordIsEmpty
        case serverFailedToValidateLoginInformation
        case serverFailedToValidateSignUpInformation
        
        case failedToCreateLoginUrl
        case failedToCreateLoginRequestBody
        
        case failedToSignUp
        
        
        var alertTitle: String {
            switch self {
            case .usernameIsTooShort: return "usernameIsTooShort"
            case .passwordIsEmpty: return "passwordIsEmpty"
            case .serverFailedToValidateLoginInformation: return "serverFailedToValidateLoginInformation"
            case .failedToCreateLoginUrl: return "failedToCreateLoginUrl"
            case .failedToCreateLoginRequestBody: return "failedToCreateLoginRequestBody"
            case .failedToSignUp: return "failedToSignUp"
            case .serverFailedToValidateSignUpInformation: return "serverFailedToValidateSignUpInformation"
            }
        }
    }
    
    init(networkManager: NetworkManager = .shared) {
        self.networkManager = networkManager
    }

    

    func login(username: String, password: String) async throws -> Bool {
        print("pass3")
        print(password)
        
        guard username.count >= 8 else {
            throw Error.usernameIsTooShort
        }
        
        guard !password.isEmpty else {
            throw Error.passwordIsEmpty
        }
        
        let loginUrlRequest = try createLoginUrlRequest(username: username, password: password)
   
        
        guard let loginResponse = try? await networkManager.send(urlRequest: loginUrlRequest) else {
            throw Error.serverFailedToValidateLoginInformation
        }
        
        return loginResponse.isSuccess

    }
    
    
    private func createLoginUrlRequest(username: String, password: String) throws -> URLRequest {
        let host = "http://127.0.0.1:8080" + "/api/v1"
        
        guard let loginEndpointUrl = URL(string: host + "/login") else {
            throw Error.failedToCreateLoginUrl
        }
        
        var urlRequest = URLRequest(url: loginEndpointUrl)
        
        urlRequest.httpMethod = "POST"
        
        let loginRequestBody = LoginRequestBody(username: username, password: password)
        
        
        guard let requestBody = try? JSONEncoder().encode(loginRequestBody) else {
            throw Error.failedToCreateLoginRequestBody
        }
        
        urlRequest.httpBody = requestBody
        
        return urlRequest
    }
    
    private func createSignUpUrlRequest(username: String, email: String, password: String) throws -> URLRequest {
        let host = "http://127.0.0.1:8080" + "/api/v1"
        
        guard let endPointUrl = URL(string: host + "/signup") else {
            throw Error.failedToCreateLoginUrl
        }
        
        var urlRequest = URLRequest(url: endPointUrl)
        
        urlRequest.httpMethod = "POST"
        
        let requestBody = SignUpRequestBody(username: username, email: email, password: password)
        
        
        guard let encodedRequestBody = try? JSONEncoder().encode(requestBody) else {
            throw Error.failedToCreateLoginRequestBody
        }
        
        urlRequest.httpBody = encodedRequestBody
        
        return urlRequest
    }
    

    
    
    static let shared = AuthenticationService()
    
    
    private let networkManager: NetworkManager
    
}


struct LoginRequestBody: Encodable {
    let username: String
    let password: String
}

struct SignUpRequestBody: Encodable {
    let username: String
    let email: String
    let password: String
}
