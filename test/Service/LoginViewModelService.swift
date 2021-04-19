//
//  File.swift
//  test
//
//  Created by Darren Hurst on 2021-03-28.
//
struct LoginViewModelService: Codable {
    var username: String
    var password: String
    var rememberMe: Bool
}


class firstClass {
    var firstClass: Seating!
}

class secondClass {
    var availableFood:[availableFood] = []
  
}

struct availableFood {
    var item: String?
    var description: String?
}

let ticket:firstClass = firstClass()

class Seating {
    
    var food = [availableFood]()
    var countAvailable: Int {
        return food.count
    }
    subscript(i: Int) -> availableFood {
        get {
            return food[i]
        }
        set {
            food[i] = newValue
        }
    }
    func printAvailableFood() {
        print("The number of rooms is \(countAvailable)")
    }
  
}
/*
Example 1:
Input: s = "barfoothefoobarman", words = ["foo","bar"]
Output: [0,9]

 */

    

/*
Example 2:
Input: s = "wordgoodgoodgoodbestword", words = ["word","good","best","word"]
Output: [] */




//Output: [6,9] */
//print(_, mapvar)
