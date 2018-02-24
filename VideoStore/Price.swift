import Foundation

public protocol Price {
    var priceCode: PriceCode { get }
    func getCharge(daysRented: Int) -> Double
}

public class ChildrenPrice: Price {
    public var priceCode: PriceCode = .childern

    public func getCharge(daysRented: Int) -> Double {
        var result:Double = 1.5
        if (daysRented > 3) {
            result += Double(daysRented - 3) * 1.5
        }
        return result
    }
}

public class RegularPrice: Price {
    public var priceCode: PriceCode = .regular

    public func getCharge(daysRented: Int) -> Double {
        var result:Double = 2
        if (daysRented > 2) {
            result += Double(daysRented - 2) * 1.5
        }
        return result
    }
}

public class NewReleasePrice: Price {
    public var priceCode: PriceCode = .newRelease

    public func getCharge(daysRented: Int) -> Double {
        return Double(daysRented) * 3
    }
}