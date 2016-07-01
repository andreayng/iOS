import Foundation
import Quick
import Nimble
import SwiftyJSON

@testable import HelloRest

class PeopleTransformerTests: QuickSpec {
    override func spec() {
        describe("TransformListOfPeople") {
            it("should take a json response without detail and transform it into a person") {
                let expectedPerson = Person(id: 1, name: "someName")
                let jsonResponse = JSON([["id": 1, "name":"someName"]])
                let actualPerson = PeopleTransformer.transformListOfPeople(jsonResponse).first
                expect(expectedPerson) == actualPerson
            }
            it("should take a json response with phone number and transform it into a person") {
                let expectedPerson = Person(id: 1, name: "someName", phone: "somePhoneNumber")
                let jsonResponse = JSON([["id": 1, "name":"someName", "phone":"somePhoneNumber"]])
                let actualPerson = PeopleTransformer.transformListOfPeople(jsonResponse).first
                expect(expectedPerson) == actualPerson
            }
        }
    }
}