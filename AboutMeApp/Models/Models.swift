//
//  Models.swift
//  AboutMeApp
//
//  Created by Влад Руденко on 24.03.2024.
//

import Foundation

struct User {
    let login: String
    let password: String
    var userData: Person
    
    static func getUsers() -> [User] {
        [
            User(
                login: "admin",
                password: "admin",
                userData: Person(
                    firstName: "Vlad",
                    secondName: "Rudenko",
                    company: "SwiftBook",
                    department: "Students",
                    role: "Junior Student",
                    bio: "Начал обучение на платформе SwiftBook в январе 2024 года. До этого имел опыт обучения iOS разработки на платформе Udemy на курсах Angela Yu. На данный момент проходит 2 модуль программы обучения на Junior разработчика",
                    avatar: "person.fill")),
            User(
                login: "elden",
                password: "ring",
                userData: Person(
                    firstName: "Hidetaka",
                    secondName: "Miyazaki",
                    company: "FromSoftware, Inc.",
                    department: "Managment",
                    role: "President",
                    bio: "Japanese creative director, designer, writer, and president of the video game company FromSoftware. He joined the company in 2004 and was a designer for the Armored Core series before receiving wider recognition for creating the Dark Souls series. Miyazaki was promoted to company president in 2014 and also serves as its representative director. Other games he has directed include Demon's Souls, Bloodborne, Sekiro, and Elden Ring, which have all received critical acclaim.",
                    avatar: "pencil"))
        ]
    }
}

struct Person {
    var firstName: String
    var secondName: String
    var company: String
    var department: String
    var role: String
    var bio: String
    var avatar: String
}
