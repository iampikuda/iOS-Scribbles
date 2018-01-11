
let x = 10.0


func toBinary(_ number: Int) -> String {
    var quotient = number
    var remainder = 0
    var answer = ""

    while quotient > 0 {

        remainder = quotient % 2
        quotient = quotient / 2

        answer += String(remainder)
    }
//    let characters =  answer

    return String(answer.reversed())
}

//func easierBinary(_ number: Int) -> String {
//    return String(number, radix: 2)
//}

public func solution(_ N : Int) -> Int {

    let binaryVersion = toBinary(N)

    var answer: Int = 0
    var tempAnswer: Int = 0

    for char in binaryVersion {
        if char == "0" {
            tempAnswer += 1
        } else if tempAnswer > answer {
            answer = tempAnswer
            tempAnswer = 0
        } else if char == "1" {
            tempAnswer = 0
        }
    }
    return answer
}

public func solution2(_ N : Int) -> Int {
    // code in Swift 2.2
    var n = N

    while n > 0 && n % 2 == 0 {
        n /= 2
    }

    var i = 0
    var l = 0

    while n > 0 {
        if n % 2 == 0 {
            i += 1
        } else {
            l = max(i, l)
            i = 0
        }
        n /= 2
    }
    return l
}

solution(1376796946)
solution2(20)








