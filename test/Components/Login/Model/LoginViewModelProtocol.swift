//
//  LoginViewModelProtocol.swift
//  test
//
//  Created by Darren Hurst on 2021-03-27.
//

protocol LoginViewModelProtocol {
    var username: String { get set }
    var password: String { get set }
    static var shared: LoginViewModel { get set }
}
