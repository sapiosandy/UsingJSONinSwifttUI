//
//  ContentView.swift
//  UsingJSONinSwifttUI
//
//  Created by Sandra Gomez on 4/18/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var message = ""
    
    func doSomething() {
        let url = Bundle.main.url(forResource: "names", withExtension: "json")
        guard let jsonData = url else {
            print("Data not found")
            return
        }
        guard let data = try? Data(contentsOf:jsonData) else {return}
        
        guard let json = try? JSONSerialization.jsonObject(with: data, options: []) else {return}
        
        if let dictionary = json as? [String: Any] {
            if let name = dictionary["name"] as? String {
                message += "\(name)"
            }
            if let age = dictionary["age"] as? Int {
                message += " is a \(age) year old "
            }
            if let gender = dictionary["gender"] as? String {
                message += "\(gender)."
            }
        }
    }
    
//    let jsonString = """
//    {
//        "name": "Frank",
//        "age": 48,
//        "gender": "male",
//    }
//    """
    
    // This structure will hold the JSON Data that consists of a name(String), age (Int), and gender (String).
//    struct Employee: Codable {
//        var name: String
//        var age: Int
//        var gender: String
//    }
    
    var body: some View {
//            let jsonStuff = jsonString.data(using: .utf8)
//            let decoder = JSONDecoder()
//            let person = try! decoder.decode(Employee.self, from: jsonStuff!)
//            let message = "\(person.name) is a \(person.age) year old \(person.gender)"
        VStack {
            Text(message)
            Button(action: doSomething) {
                Text ("Get JSON data")
            }
        }
    }
}

#Preview {
    ContentView()
}
