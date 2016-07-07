import Foundation
import ReactiveCocoa

struct PeopleDetailsViewModel {
    let person = MutableProperty<Person?>(nil)
    let peopleService: PeopleServiceType
    
    init(withID id: Int, peopleService: PeopleServiceType) {
        self.peopleService = peopleService
        peopleService.getPersonByID(withID: id) { person in
            self.person.value = person
        }
    }
    
    var name: String {
        return unwrapPerson().name
    }
    
    var age: String {
        let person = unwrapPerson()
        let age = person.age ?? 0
        return "\(age == 0 ? "" : "\(age)")"
    }
    
    var phone: String? {
        return unwrapPerson().phone ?? ""
    }
    
    private func unwrapPerson() -> Person {
        return person.value ?? Person(id: 0, name: "")
    }
}