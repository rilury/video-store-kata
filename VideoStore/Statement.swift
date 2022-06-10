import Foundation

public class Statement {
    
    public var customerName: String
    private var rentals: [Rental] = []
    private var totalAmount: Double = 0
    private var frequentRenterPoints: Int = 0
    
    private var header: String {
        return "Rental Record for \(customerName)\n"
    }
    
    private var footer: String {
        return "Amount owed is \(totalAmount)\nYou earned \(frequentRenterPoints) frequent renter points\n"
    }
    
    public init(customerName: String) {
        self.customerName = customerName
    }
    
    public func add(rental: Rental) {
        rentals.append(rental)
    }
    
    public func getTotal() -> Double {
        return totalAmount
    }
    
    public func getFrequentRenterPoints() -> Int {
        return frequentRenterPoints
    }
    
    public func calculateRentalValues() {
        var _ = generate()
    }
    
    public func generate() -> String {
        var statementText = header
        statementText += rentalLines()
        statementText += footer
        
        return statementText
    }
    
    private func rentalLines() -> String {
        var rentalLines = ""
        for rental in rentals {
            
            rentalLines += rentalLine(rental: rental)
        }
        
        return rentalLines
    }
    
    private func rentalLine(rental: Rental) -> String {
        
        let rentalAmount = rental.determineAmount()
        frequentRenterPoints += rental.determineFrequentRenterPoints()
        totalAmount += rentalAmount
        
        return formatRentalLine(rental: rental, rentalAmount: rentalAmount)
    }

    private func formatRentalLine(rental: Rental, rentalAmount: Double) -> String {
       return "\t\(rental.title)\t\(rentalAmount)\n"
    }
}
