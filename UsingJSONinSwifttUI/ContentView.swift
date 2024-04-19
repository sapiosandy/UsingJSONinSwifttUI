//
//  ContentView.swift
//  UsingJSONinSwifttUI
//
//  Created by Sandra Gomez on 4/18/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var message = ""
    let jsonString = """
    {
        "name": "Frank",
        "age": 48,
        "gender": "male",
    }
    """
    
    // This structure will hold the JSON Data that consists of a name(String), age (Int), and gender (String).
    struct Employee: Codable {
        var name: String
        var age: Int
        var gender: String
    }
    
    
    
    var body: some View {
            let jsonStuff = jsonString.data(using: .utf8)
            let decoder = JSONDecoder()
            let person = try! decoder.decode(Employee.self, from: jsonStuff!)
            let message = "\(person.name) is a \(person.age) year old \(person.gender)"
        VStack {
            Text(message)
        }
    }
}

#Preview {
    ContentView()
}
