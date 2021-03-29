//
//  LoginViewModel.swift
//  test
//
//  Created by Darren Hurst on 2021-03-19.
//

import Foundation
import SwiftUI
import Combine


struct Response: Codable {
    var results: [LoginViewModelService]
}
public class LoginViewModel: ObservableObject, LoginViewModelProtocol {
 
    //Protocol
    @Published var username: String = ""
    @Published var password: String = ""
    static var shared: LoginViewModel = LoginViewModel()
    
    @Published var usernameMessage: String = ""
    @Published var passwordMessage: String = ""
    @Published var rememberMe: Bool = false
    @Published var showMain: Bool = false
    
    @Published var buttonClicked: Bool = false // button click

    
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
        
        
        validLogin.receive(on: RunLoop.main)
             .assign(to: \.buttonClicked, on: self)
             .store(in: &cancellableSet)
      
    }
    
    public var isUsernameValidPublisher: AnyPublisher<Bool, Never> {
       $username
         .debounce(for: 0.2, scheduler: RunLoop.main)
         .removeDuplicates()
         .map { input in
           return input.count >= 3
         }
         .eraseToAnyPublisher()
     }

    public var isPasswordValidPublisher: AnyPublisher<Bool, Never> {
       $password
         .debounce(for: 0.2, scheduler: RunLoop.main)
         .removeDuplicates()
         .map { input in
           return input.count >= 3
         }
         .eraseToAnyPublisher()
     }
    public var isButtonClicked: AnyPublisher<Bool, Never> {
       $buttonClicked
         .debounce(for: 0.2, scheduler: RunLoop.main)
         .removeDuplicates()
        .map { value in
            return value
         }
         .eraseToAnyPublisher()
     }
    
    private var validLogin: AnyPublisher<Bool, Never> {
        return Publishers.CombineLatest3(isUsernameValidPublisher, isPasswordValidPublisher, isButtonClicked)
            .map { username, password, buttonClicked in
                if (!buttonClicked) {
                    return username && password && buttonClicked
                }
                else {
                        self.processLogin()
                    }
            return username && password && buttonClicked
        }.eraseToAnyPublisher()
    }
    
    
   
    func processLogin()  {
        
        
        if !self.showMain {
            if  username == "Test" && password == "abcd" {
            showMain = true
        }
        else {
            buttonClicked = false
        }
        }
 
        
    }
   
}



    
