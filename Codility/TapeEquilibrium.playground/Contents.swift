


public func solution(_ A : inout [Int]) -> Int {

    var lowest = Int.max
    if A.count < 2 { return 0 }
    for x in 1..<A.count {
        let diff = abs(A[..<x].reduce(0,+) - A[x..<A.count].reduce(0,+))
        // reduce function done on every loop...not good

        if diff == 0 { return diff }
        if diff < lowest { lowest = diff }
    }
    return lowest
}

var london = [2,4,1,5,2,6]
solution(&london)

public func solution2(_ A : inout [Int]) -> Int {
    var lsum = 0
    var rsum = A.reduce(0,+) // reduce function only done once outside the loop
    var lowest = Int.max
    var index = 0

    if A.count < 2 { return 0 }

    for _ in 1..<A.count {
        lsum += A[index]
        rsum -= A[index]
        let diff = abs( lsum - rsum )

        if diff == 0 { return diff }
        if diff < lowest { lowest = diff }
        index += 1
    }
    return lowest
}

var london2 = [2,4,1,5,2,6]
solution2(&london2)
