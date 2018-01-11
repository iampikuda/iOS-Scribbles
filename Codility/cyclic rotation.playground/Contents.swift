

public func solution(_ A : inout [Int], _ K : Int) -> [Int] {

    if A.count == 0 || K % A.count == 0 {
        return A
    }
    let tempArray = A
    var counter = 0

    for number in tempArray {
        var newIndex = counter + K

        if newIndex > tempArray.count - 1 {
            newIndex = newIndex % A.count
        }

        A[newIndex] = number
        counter += 1
    }

    return A
}

public func solution2(_ A : inout [Int],_ K : Int) -> [Int] {
    // write your code in Swift 2.2
    if A.count == 0 {
        return A
    }

    for _ in 0..<K {
        A.insert(A.removeLast(), at: 0)
    }

    return A
}

var ok: [Int] = [3,5,1,3,2]
solution(&ok, 999)

