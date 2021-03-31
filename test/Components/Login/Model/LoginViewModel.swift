//
//  LoginViewModel.swift
//  test
//
//  Created by Darren Hurst on 2021-03-19.
//

import Foundation
import SwiftUI
import Combine


class FormModel: ObservableObject, Identifiable {
    @Published var username: String
    @Published var password: String
    @Published var usernameMessage: String
    @Published var passwordMessage:  String
    @Published var rememberMe: Bool = false
    @Published var showMain: Bool = false
    @Published var buttonClicked: Bool = false
    
 
    public var disposables: Set<AnyCancellable>
    
    init() {
        self.disposables = Set<AnyCancellable>()
        self.username = ""
        self.password = ""
        self.usernameMessage =  ""
        self.passwordMessage = ""
        
        self.rememberMe = false
        self.showMain = false
        self.buttonClicked = false
        
        isUsernameValidPublisher.receive(on: RunLoop.main)
             .map { valid in
               valid ? "" : "User name must at least have 3 characters"
             }
            .assign(to: \.usernameMessage, on: self)
            .store(in: &disposables)
        
        isPasswordValidPublisher.receive(on: RunLoop.main)
             .map { valid in
               valid ? "" : "Password must at least have 3 characters"
             }
            .assign(to: \.passwordMessage, on: self)
            .store(in: &disposables)
        
        
       validLogin.receive(on: RunLoop.main)
            .assign(to: \.buttonClicked, on: self)
            .store(in: &disposables)
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
         
         
         if !showMain {
             if  username == "Test" && password == "abcd" {
                 showMain = true
         }
         else {
            buttonClicked = false
         }
         }
  
         
     }
    
}

final class LoginViewModel {
    
    @ObservedObject var formModel: FormModel
    
    private var cancellableSet: Set<AnyCancellable> = []
    init() {
        self.formModel = FormModel()
    }

   
 /*   func decode<T: Decodable>(_ data: Data) -> AnyPublisher<T, Error> {
      let decoder = JSONDecoder()
      decoder.dateDecodingStrategy = .secondsSince1970

      return Just(data)
        .decode(type: T.self, decoder: decoder)
        .mapError { error in
            return error
        }
        .eraseToAnyPublisher()
    }*/
}



    
