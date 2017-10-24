func whatCanIDo(with entry: Any) {

    if let word = entry as? String {

        print("You can concatenate -->> \(word + word) <<--")

        print("You can split it -->> \(Array(word)) <<--")

        print("etc.")

    } else if let interger = entry as? Int {

        print("You can add it up -->> \(interger + interger) <<--")

        print("...and perform other arithmetic methods")

        print("etc.")

    } else if let float = entry  as? Double {

        print("You can add it up -->> \(float + float) <<--")

        print("...and perform other arithmetic methods")

        print("etc.")
    }

}
whatCanIDo(with: "Damisi")
whatCanIDo(with: 90)
whatCanIDo(with: 1.2)
