class Person {
    let name: String
    var apartment: Apartment?

    init(name: String) {
        self.name = name
    }

    deinit{
        print("\(name) deinitialized")
    }
}

class Apartment {
    let unit: String
    weak var tenant: Person?

    init(unit: String) {
        self.unit = unit
    }

    deinit {
        print("APT \(unit) deinitialized")
    }
}

var alice: Person? = Person(name: "Alice")  // Person 참조 카운트 : 1
// alcie -> Person()
var unit4A: Apartment? = Apartment(unit: "unit4A")// APT 참조 카운트 : 1
//unit4A -> APT()

alice!.apartment = unit4A  // Person 참조 카운트 : 2
// alice -> Person() -> APT()
unit4A!.tenant = alice     // APT 참조 카운트 : 2
//unit4A -> APT() -> Person()

alice = nil  // alice -/-> Person() -> APT()unit4A = nil   // unit4A -/->   APT() -> Person()

// Person() <-> APT()

// 참조카운트를 증가시키지 않는 키워드를 이용 (weak or unowned)

// weak를 누구한테?
// 