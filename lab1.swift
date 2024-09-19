import SwiftUI
import UIKit // Instead of Cocoa

// Перерахування JobPosition
enum JobPosition {
    case developer
    case designer
    case manager
}

class Person {
    var name: String
    var surname: String?
    var age: Int?

    // Ініціалізатор
    init(firstName: String, lastName: String? = nil, age: Int? = nil) {
        self.name = firstName
        self.surname = lastName
        self.age = age
        
    }

    // Метод для виведення повної інформації
    func fullInfo() -> String {
        var info = "First Name: \(name)"

        if let surname = surname {
            info += ", Last Name: \(surname)"
        } else {
            info += ", Last Name: Not provided"
        }

        if let age = age {
            info += ", Age: \(age)"
        } else {
            info += ", Age: Not provided"
        }
        
        return info
    }
    func birthDayYear()->String{
        let date = Date()
        let calendar = Calendar.current
        let year = calendar.component(.year,from: date)
        var infoAboutYear = "your birthday year is: "
        if let age = age {
            infoAboutYear += " \(year-age)"
        }
        return infoAboutYear
    }
    // Метод для привітання
    func greet() -> String {
        var greeting = "Hello, \(name)"

        if let surname = surname {
            greeting += " \(surname)"
        }
        
        if let age = age {
            greeting += ", you are \(age) years old."
        } else {
            greeting += ", your age is not provided."
        }
        
        return greeting
    }
}

// Функція для привітання
func greetPerson(person: Person) -> String {
    var greeting = "Hello, \(person.name)"
    
    if let surname = person.surname {
        greeting += " \(surname)"
    }
    
    if let age = person.age {
        greeting += ", you are \(age) years old."
    } else {
        greeting += ", your age is not provided."
    }
    
    return greeting
}

struct Address {
    var street: String
    var city: String
    var postalCode: Int?  // Опціональне значення для індексу

    // Ініціалізатор
    init(street: String, city: String, postalCode: Int? = nil) {
        self.street = street
        self.city = city
        self.postalCode = postalCode
    }

    // Метод для виведення повної адреси
    func fullAddress() -> String {
        var addressInfo = "\(street), \(city)"
        
        if let postalCode = postalCode {
            addressInfo += ", Postal Code: \(postalCode)"
        } else {
            addressInfo += ", Postal Code: Not provided"
        }
        
        return addressInfo
    }
}

class Employee: Person {
    var jobPosition: JobPosition    // Властивість для посади (перерахування)
    var address: Address             // Властивість для адреси

    // Ініціалізатор
    init(firstName: String, lastName: String? = nil, age: Int? = nil, jobPosition: JobPosition, address: Address) {
        self.jobPosition = jobPosition
        self.address = address
        super.init(firstName: firstName, lastName: lastName, age: age) // Виклик ініціалізатора батьківського класу
    }

    // Метод для виведення інформації про співробітника
    override func fullInfo() -> String {
        let personInfo = super.fullInfo() // Виклик методу батьківського класу
        return "\(personInfo), Position: \(jobPosition), Address: \(address.fullAddress())"
    }

    // Метод для привітання
    override func greet() -> String {
        let personGreeting = super.greet() // Виклик методу батьківського класу
        return "\(personGreeting) and your position is \(jobPosition)."
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            // Приклади використання
            let person1 = Person(firstName: "Pavlo", lastName: "Ivanov", age: 30)
            
            Text(person1.greet()) // Виведе: Hello, Pavlo Ivanov, you are 30 years old.
            Text(person1.birthDayYear())
            Text(greetPerson(person: person1)) // Виведе: Hello, Pavlo Ivanov, you are 30 years old.

            let person2 = Person(firstName: "Olena", lastName: nil, age: nil)
            Text(person2.greet()) // Виведе: Hello, Olena, your age is not provided.
            Text(greetPerson(person: person2)) // Виведе: Hello, Olena, your age is not provided.

            let address1 = Address(street: "Shevchenka St.", city: "Kyiv", postalCode: 01601)
            Text(address1.fullAddress()) // Виведе: Shevchenka St., Kyiv, Postal Code: 01601

            let address2 = Address(street: "Central Ave.", city: "Lviv")
            Text(address2.fullAddress()) // Виведе: Central Ave., Lviv, Postal Code: Not provided

            // Створення співробітника
            let employee1 = Employee(firstName: "Pavlo", lastName: "Ivanov", age: 30, jobPosition: .developer, address: address1)

            // Виведення повної інформації про співробітника
            Text(employee1.fullInfo())
            // Виведе: First Name: Pavlo, Last Name: Ivanov, Age: 30, Position: developer, Address: Shevchenka St., Kyiv, Postal Code: 01601

            // Виведення привітання
            Text(employee1.greet())
            // Виведе: Hello, Pavlo Ivanov, you are 30 years old and your position is developer.
        }
        .padding()
    }
}



