import Foundation

public class Rental {
    
    public private(set) var movie: Movie
    public var daysRented: Int
    
    public var title: String {
        return movie.title
    }
    
    public init(movie: Movie, daysRented: Int) {
        self.movie = movie
        self.daysRented = daysRented
    }
    
    public func determineAmount() -> Double {
        return movie.determineAmount(daysRented: daysRented)
    }
    
    public func determineFrequentRenterPoints() -> Int {
        return movie.determineFrequentRenterPoints(daysRented: daysRented)
    }
    
}
