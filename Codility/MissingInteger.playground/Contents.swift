
public func solution1(_ A : inout [Int]) -> Int {

    let max = A.max()!

    if max < 0 { return 1 }

    for number in 1..<max {
        if A.contains(number) {
            continue
        } else {
            return number
        }
    }
    return 1
}

var input1 = [1, 3, 6, 4, 1, 2]
solution1(&input1)

// Performance stats are not good....two loops and Dictionary method next


public func solution(_ A : inout [Int]) -> Int {

    var checker = [Int : Bool]()

    for number in A {
        checker[number] = true
    }

    var no = 1

    while true {
        if checker[no] == nil { return  no }
        no += 1
    }

}

var input = [1, 3, 6, 4, 1, 2]
solution(&input)
