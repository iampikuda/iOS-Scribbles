var londo = [9999,9090,11, 12, 15, 21, 23, 29, 55, 56, 62, 75, 82, 103, 108, 118, 124, 128, 142, 154, 180, 196, 201, 213, 220, 223, 227, 241, 242, 286, 300, 335, 346, 348, 370, 371, 375, 388, 401, 407, 410, 420, 422, 425, 458, 459, 463, 465, 468, 469, 491, 505, 506, 515, 518, 524, 562, 567, 569, 585, 594, 603, 622, 626, 627, 647, 654, 655, 657, 660, 678, 692, 701, 709, 715, 736, 740, 754, 758, 770, 771, 782, 784, 789, 795, 812, 831, 844, 846, 848, 856, 859, 875, 879, 881, 884, 923, 965, 974, 983, 988, 993,
             11, 12, 15, 21, 23, 29, 55, 56, 62, 75, 82, 103, 108, 118, 124, 128, 142, 154, 180, 196, 201, 213, 220, 223, 227, 241, 242, 286, 300, 335, 346, 348, 370, 371, 375, 388, 401, 407, 410, 420, 422, 425, 458, 459, 463, 465, 468, 469, 491, 505, 506, 515, 518, 524, 562, 567, 569, 585, 594, 603, 622, 626, 627, 647, 654, 655, 657, 660, 678, 692, 701, 709, 715, 736, 740, 754, 758, 770, 771, 782, 784, 789, 795, 812, 831, 844, 846, 848, 856, 859, 875, 879, 881, 884, 923, 965, 974, 983, 988, 993,
             9999]
var ok = [9,8,7,5,4,9]

//func feederFunc(A: inout [Int]) -> Int {
//
//    if A.count == 1 { return A.first! }
//    let number = A.first!
//    A = Array(A.dropFirst())
//
//    var there = true
//
//    for n in A {
//
//        if number == n {
//            let index = A.index(of: n)!
//            A.remove(at: index)
//            there = true
//            break
//        }
//        there = false
//    }
//    if there {
//        return feederFunc(A: &A)
//    } else {
//        return number
//    }
//}
//
//func ok(_ array: inout [Int]) -> Int {
//
//    while array.count > 1 {
//
//        let first = array.first!
//        array = Array(array.dropFirst())
//
//        if !array.contains(first) {
//            return first
//        } else {
//            let index = array.index(of: first)
//            array.remove(at: index!)
//            return ok(&array)
//        }
//    }
//    return array.first!
//}

public func solution(_ A : inout [Int]) -> Int {

    var mapper: [Int: Int] = [:]

    for i in A {
        if let ok = mapper[i] {
            mapper[i] = ok + 1
        } else {
            mapper[i] = 1
        }
    }

    let keyValuePair = mapper.first(where: { $1 % 2 == 1 })!
    return keyValuePair.key
}

solution(&londo)

func bado(_ A : inout [Int]) -> Int{
    var z = 0

    for i in A {
        z ^= i
    }

    return z
}

bado(&londo)






