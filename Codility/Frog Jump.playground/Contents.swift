

public func solution(_ X : Int, _ Y : Int, _ D : Int) -> Int {
    // code in Swift 3.0 
    if Y - X == 0 || D == 0 {
        return 0
    }
    return Int((Double(abs(Y - X)) / Double(D)).rounded(.up))
}
