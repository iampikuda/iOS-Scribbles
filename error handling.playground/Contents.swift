enum InvalidNames: Error {
    case ContainsNumber(String)
    case HasSpaces(String)
    case IsMine(String)
}

class Person {
    
    var hasNumber = false
    var hasSpace = false
    var isMine = false
    
    func myNameIs(_ name: String) throws -> String {
        for character in name.characters {
            if !hasSpace && character == " " {
                hasSpace = true
            }
            if !hasNumber && ["0","1","2","3","4","5","6","7","8","9"].contains(character){
                hasNumber = true
            }
            if !isMine && name.lowercased() == "pikuda"{
                isMine = true
            }
        }

        guard !isMine else {
            throw InvalidNames.IsMine("That's my name! Not cool!")
        }
        guard !hasSpace else {
            throw InvalidNames.HasSpaces("Leave your ancestors out of this! Remove the spaces!")
        }
        guard !hasNumber else {
            throw InvalidNames.ContainsNumber("Are you an android? No numbers please!")
        }
        
        return "Your name, \(name) has been saved."
    }
}
var newPerson = Person()
do {
    try newPerson.myNameIs("piKud a9")
} catch InvalidNames.IsMine(let errorMessage) {
    print(errorMessage)
} catch InvalidNames.HasSpaces(let errorMessage) {
    print(errorMessage)
} catch InvalidNames.ContainsNumber(let errorMessage) {
    print(errorMessage)
}

