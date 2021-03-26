//
//  LoginViewModel.swift
//  test
//
//  Created by Darren Hurst on 2021-03-19.
//

import Foundation
import SwiftUI
import Combine

protocol LoginViewModelProtocol {
    var username: String { get set }
    var password: String { get set }
    static var shared: LoginViewModel { get set }
}

public class LoginViewModel: ObservableObject, LoginViewModelProtocol {
 
    //Protocol
    @Published var username: String = ""
    @Published var password: String = ""
    static var shared: LoginViewModel = LoginViewModel()
    
    @Published var usernameMessage: String = ""
    @Published var passwordMessage: String = ""
    @Published var rememberMe: Bool = false

    
    private var cancellableSet: Set<AnyCancellable> = []

    init() {
        
        isUsernameValidPublisher.receive(on: RunLoop.main)
             .map { valid in
               valid ? "" : "User name must at least have 3 characters"
             }
             .assign(to: \.usernameMessage, on: self)
             .store(in: &cancellableSet)
        
        isPasswordValidPublisher.receive(on: RunLoop.main)
             .map { valid in
               valid ? "" : "Password must at least have 3 characters"
             }
             .assign(to: \.passwordMessage, on: self)
             .store(in: &cancellableSet)
      
      
        
    }
    
    public var isUsernameValidPublisher: AnyPublisher<Bool, Never> {
       $username
         .debounce(for: 0.8, scheduler: RunLoop.main)
         .removeDuplicates()
         .map { input in
           return input.count >= 3
         }
         .eraseToAnyPublisher()
     }
    
    public var isPasswordValidPublisher: AnyPublisher<Bool, Never> {
       $password
         .debounce(for: 0.8, scheduler: RunLoop.main)
         .removeDuplicates()
         .map { input in
           return input.count >= 3
         }
         .eraseToAnyPublisher()
     }
   
   
}

class LoginService: NSURLConnection {
    var response = "LOL IT WORKED"
}
    
