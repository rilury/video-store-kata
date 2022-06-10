import XCTest
@testable import VideoStore

class CustomerTests: XCTestCase {

    private var statement: Statement!
    private var newReleaseMovie1: NewReleaseMovie!
    private var newReleaseMovie2: NewReleaseMovie!
    private var childrensMovie1: ChildrensMovie!
    private var childrensMovie2: ChildrensMovie!
    private var regular1: RegularMovie!
    private var regular2: RegularMovie!
    private var regular3: RegularMovie!

    public override func setUp() {
        super.setUp()
        statement = Statement(customerName: "Customer")
        newReleaseMovie1 = NewReleaseMovie(title: "New Release 1")
        newReleaseMovie2 = NewReleaseMovie(title: "New Release 2")
        childrensMovie1 = ChildrensMovie(title: "Childrens 1")
        childrensMovie2 = ChildrensMovie(title: "Childrens 2")
        regular1 = RegularMovie(title: "Regular 1")
        regular2 = RegularMovie(title: "Regular 2")
        regular3 = RegularMovie(title: "Regular 3")
    }

    public func testSingleNewReleaseStatementTotals() {
        statement.add(rental: Rental(movie: newReleaseMovie1, daysRented: 3))
        statement.calculateRentalValues()
        XCTAssertEqual(9, statement.totalAmount)
        XCTAssertEqual(2, statement.frequentRenterPoints)
    }

    public func testDualNewReleaseStatementTotals() {
        statement.add(rental: Rental(movie: newReleaseMovie1, daysRented: 3))
        statement.add(rental: Rental(movie: newReleaseMovie2, daysRented: 3))
        
        statement.calculateRentalValues()
        XCTAssertEqual(18, statement.totalAmount)
        XCTAssertEqual(4, statement.frequentRenterPoints)
        
    }

    public func testSingleChildrensStatementTotals() {
        statement.add(rental: Rental(movie: childrensMovie1, daysRented: 3))
        statement.calculateRentalValues()
        XCTAssertEqual(1.5, statement.totalAmount)
        XCTAssertEqual(1, statement.frequentRenterPoints)
        
    }

    public func testDualChildrensStatementTotals() {
        statement.add(rental: Rental(movie: childrensMovie1, daysRented: 3))
        statement.add(rental: Rental(movie: childrensMovie2, daysRented: 4))
        statement.calculateRentalValues()
        XCTAssertEqual(4.5, statement.totalAmount)
        XCTAssertEqual(2, statement.frequentRenterPoints)
    }

    public func testMultipleRegularStatementTotals() {
        statement.add(rental: Rental(movie: regular1, daysRented: 1))
        statement.add(rental: Rental(movie: regular2, daysRented: 2))
        statement.add(rental: Rental(movie: regular3, daysRented: 3))
        statement.calculateRentalValues()
        XCTAssertEqual(7.5, statement.totalAmount)
        XCTAssertEqual(3, statement.frequentRenterPoints)
    }
    
    public func testMultipleRegularStatementFormat() {
        statement.add(rental: Rental(movie: regular1, daysRented: 1))
        statement.add(rental: Rental(movie: regular2, daysRented: 2))
        statement.add(rental: Rental(movie: regular3, daysRented: 3))

        XCTAssertEqual(
            "Rental Record for Customer\n" +
                "\tRegular 1\t2.0\n" +
                "\tRegular 2\t2.0\n" +
                "\tRegular 3\t3.5\n" +
                "Amount owed is 7.5\n" +
            "You earned 3 frequent renter points\n",
            statement.generate()
        )
    }
}
