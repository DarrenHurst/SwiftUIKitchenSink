//
//  RealmModel.swift
//  test
//
//  Created by Darren Hurst on 2021-05-13.
//

import Foundation
import RealmSwift


class Dog: Object, Identifiable  {
    @objc dynamic var name = ""
    @objc dynamic var age = 0
    var seen = false
}
class Person: Object {
    @objc dynamic var name = ""
    @objc dynamic var picture: Data? = nil // optionals supported
    var  dogs : [Dog] = []
}

protocol RealmProtocol {
    func startConnection() -> Void
    func getPuppies() -> [Dog]
    func getDoggies() -> [Dog]
}

struct RealmModel: RealmProtocol {
    
    func match(in string: String) -> [String] {
        let words = string.components(
            separatedBy: .whitespacesAndNewlines
        )
    
        let tags = words.filter { $0.starts(with: "p") }
        return tags.map { $0 }
    }
    
      func startConnection() -> Void {
          let app = App(id: "socialnanny-gydwt")
          app.login(credentials: Credentials.anonymous) {( response ) in
           
              print("Login status: \(response)") // RLMUser
                    
              
          }
      }
    
    func getPuppies() -> [Dog] {
        let realm = try! Realm()
        return realm.objects(Dog.self).distinct(by: ["name"])
            .filter { (dog) -> Bool in
                dog.age <= 3 }
    }
    
    func getDoggies() -> [Dog] {
        let realm = try! Realm()
        return realm.objects(Dog.self).distinct(by: ["name"]).map{$0}
    }
    
    func writeNewDog(name: String, age: Int) -> Void {
        let realm = try! Realm()
        let dog = Dog.init()
        dog.name = name
        dog.age = age
    
        try? realm.write {
         realm.add(dog)
        }
    }
    
    func deleteDogs(dogs: [Dog]) -> Void {
        let realm = try! Realm()
        try? realm.write {
         realm.delete(dogs)
        }
    }
    func addDog(dog: Dog) -> Void {
        let realm = try! Realm()
        try? realm.write {
            realm.add(dog)
        }
    }
}

