

public func solution(_ X : Int, _ A : inout [Int]) -> Int {

    var checker = [Int : Bool]()

    for number in A {

        if number <= X {
            checker[number] = true
        }
        if checker.count == X {
            return A.index(of: number)!
        }
    }
    return -1
}

var input = [1, 3, 1, 4, 2, 3, 5, 4]

solution(3, &input)
