let name = "audax"

func howLong(word: String) {

    let count = name.count

    var deficit: Int = 0

    var length = word.count

    while length < count {

        length += 1

        deficit += 1
    }

    if deficit != 0 {
        print("oops! You needs \(deficit) more letters")
    } else if length == count {
        print("Same length")
    } else if length > count {
        print("Too many letters!!!")
    }

}


howLong(word: "Paula")
howLong(word: "Damisi")
howLong(word: "")

