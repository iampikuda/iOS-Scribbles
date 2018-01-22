
public func solution(_ A : inout [Int]) -> Int{

    A.sort()

    var result: Int = 1

    if A.isEmpty {
        return result
    }

    for X in 0..<A.count - 1 {

        if (A[X + 1] - A[X]) > 1 {
            return A[X] + 1
        }
    }
    if A.first! > 1 {

        return A.removeFirst() - 1
    }

    result = A.removeLast() + 1

    return result
}

public func solution2(A : inout [Int]) -> Int {
    // Assumming the array always begins from 1

    let n = A.count

    let sum = A.reduce(0, +)

    let esum = (2 + n) * (n + 1) / 2

    return esum - sum
}

