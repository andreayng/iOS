import Foundation

@testable import HelloRest

class PeopleServiceMock: PeopleServiceType {
    var getAllPeopleCalled = false
    var stubbedPeopleWithPhone = [Person(id: 1, name: "someName", phone: "somePhoneNumber")]

    func getAllPeople(onCompletion: ([Person]) -> Void){
        getAllPeopleCalled = true
        onCompletion(stubbedPeopleWithPhone)
    }
}