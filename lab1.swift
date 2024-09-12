class Person {
    var name: String
    var surname: String
    var age: Int
    
    // Конструктор ініціалізації
    init(name: String, surname: String, age: Int) {
        self.name = name
        self.surname = surname
        self.age = age
    }
    
    
    // Метод для введення інформації про користувача
    func InputInfoAboutUser() {
        print("Enter name:", terminator: "")
        if let inputName = readLine() {
            name = inputName
        }
        
        print("Enter surname:", terminator: "")
        if let inputSurname = readLine() {
            surname = inputSurname
        }
        
        print("Enter age:", terminator: "")
        if let inputAge = readLine(), let intAge = Int(inputAge) {
            age = intAge
        }
    }
    
    // Метод для виведення інформації про користувача
    func ShowInfoAboutUser() {
        print("Info about User: Name: \(name), Surname: \(surname), Age: \(age) !!!")
    }
}


// Створення об'єкта класу Person
let person = Person(name: "", surname: "", age: 0)
person.InputInfoAboutUser()
person.ShowInfoAboutUser()
