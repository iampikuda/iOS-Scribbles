
public func solutionOne(_ A : inout [Int]) -> Int {
    let input = A

    let max = input.max()!

    let actualSum = input.reduce(0, +)

    let expectedSum = (max * (max + 1)) / 2

    if expectedSum != actualSum { return 0 }

    return 1
}

var inputedArrayOne = [2,2,1,4,1]
solutionOne(&inputedArrayOne)

//What if the sums are equal but it's now a permutation eg [2,2,1,4,1]

public func solutionTwo(_ A : inout [Int]) -> Int {
    let input = Set(A)

    let max = input.max()!

    let actualSum = input.reduce(0, +)

    let expectedSum = (max * (max + 1)) / 2

    if expectedSum != actualSum { return 0 }

    return 1
}

var inputedArrayTwo = [2,2,1,4,1]
solutionTwo(&inputedArrayTwo)

//Make sure uniqueness of numbers is observed

public func solutionThree(_ A : inout [Int]) -> Int {
    let input = Set(A)

    if input.count != A.count { return 0 }

    let max = input.max()!

    let actualSum = input.reduce(0, +)

    let expectedSum = (max * (max + 1)) / 2

    if expectedSum != actualSum { return 0 }

    return 1
}

var inputedArray1 = [2,2,1,4,1]
var inputedArray2 = [3,2,4,1,5,1]

solutionThree(&inputedArray1)
solutionThree(&inputedArray2)
//solutionThree(&inputedArray3)

