import Foundation

public class Movie {

    public private(set) var title: String

    init(title: String) {
        self.title = title
    }
    
    public func determineAmount(daysRented: Int) -> Double {
        1
    }
    
    public func determineFrequentRenterPoints(daysRented: Int) -> Int {
        1
    }
}

public class NewReleaseMovie: Movie {
    
    public override func determineAmount(daysRented: Int) -> Double {
        return Double(daysRented) * 3
    }
    
    public override func determineFrequentRenterPoints(daysRented: Int) -> Int {
        return daysRented > 1 ? 2 : 1
    }
}

public class ChildrensMovie: Movie {
    
    public override func determineAmount(daysRented: Int) -> Double {
        var rentalAmount = 1.5
        if daysRented > 3 {
            rentalAmount += Double(daysRented - 3) * 1.5
        }
        
        return rentalAmount
    }
    
    public override func determineFrequentRenterPoints(daysRented: Int) -> Int {
        return 1
    }
}

public class RegularMovie: Movie {
    
    public override func determineAmount(daysRented: Int) -> Double {
        var rentalAmount: Double = 2
        if daysRented > 2 {
            rentalAmount += Double(daysRented - 2) * 1.5
        }
        return rentalAmount
    }
    
    public override func determineFrequentRenterPoints(daysRented: Int) -> Int {
        return 1
    }
}
