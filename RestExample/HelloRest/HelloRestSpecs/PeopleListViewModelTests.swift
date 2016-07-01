import Foundation
import Quick
import Nimble

@testable import HelloRest

class PeopleListViewModelTests : QuickSpec {
    override func spec() {
        describe("People List View Model") {
            var viewModel: PeopleListViewModel!
            beforeEach {
                viewModel = PeopleListViewModel(peopleService: PeopleServiceMock())
            }
            it("should initialize with a list of people") {
                expect(viewModel.people.value.count).toEventually(equal(1))
            }

            it("should return the number of people in the people list") {
                expect(viewModel.numberOfPeople).to(equal(1))
            }

            it("should return the person at an index") {
                let expectedPersonWithPhone = Person(id: 1, name: "someName", phone: "somePhoneNumber")
                expect(viewModel.getPersonAtIndex(0)).to(equal(expectedPersonWithPhone))
            }
        }
    }
}