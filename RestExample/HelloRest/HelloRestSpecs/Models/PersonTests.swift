import Foundation
import Quick
import Nimble

@testable import HelloRest


class PersonTests: QuickSpec {
    override func spec() {
        describe(".innitWithoutDetail") {
            it("should return a person with only name and id"){
                let person = Person(id: 1, name: "someName")
                expect(person.name).to(equal("someName"))
                expect(person.id).to(equal(1))
                expect(person.age).to(beNil())
                expect(person.phone).to(beNil())
            }
        }
        describe("equality of people") {
            it("should return true when two people are the same") {
                let person = Person(id: 1, name: "someName", age: 18, phone: "somePhoneNumber")
                let samePerson = Person(id: 1, name: "someName", age: 18, phone: "somePhoneNumber")

                expect(person) == samePerson
            }

            it("should return false when two people are different") {
                let person = Person(id: 1, name: "someName", age: 18, phone: "somePhoneNumber")
                let differentPerson = Person(id: 2, name: "different", age: 15, phone: "differentPhoneNumber")

                expect(person) != differentPerson
            }
        }
        describe("initWithPhoneNumber"){
            it("should return a person with only name and id and phone"){
                let person = Person(id: 1, name: "someName", phone: "somePhoneNumber")
                expect(person.name).to(equal("someName"))
                expect(person.id).to(equal(1))
                expect(person.age).to(beNil())
                expect(person.phone).to(equal("somePhoneNumber"))
            }
        }
    }
}