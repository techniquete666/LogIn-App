//
//  UserInfo.swift
//  Log In
//
//  Created by Vyacheslav on 05.10.2022.
//

import Foundation


struct User {
    let login: String
    let password: String
    let person: Person
    
    static func getInfoAbout() -> Person {
       Person(
        name: "Vyacheslav",
        surname: "Bootko",
        yearOfBirth: "19.11.1997",
        placeOfBirth: "Angarsk"
       )
    }
}

struct Person {
    let name: String
    let surname: String
    let yearOfBirth: String
    let placeOfBirth: String
}
