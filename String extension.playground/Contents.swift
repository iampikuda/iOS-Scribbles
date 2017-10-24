extension String {

    var words: [String] { return splitIntoArray() }

    func splitIntoArray() -> [String] {

        let sentence = self.split(separator: " ")

        return sentence.map{ String($0) }
    }
}

let manga =  "pikuda paul oluwadamisi"

print(manga)
print(manga.words)

