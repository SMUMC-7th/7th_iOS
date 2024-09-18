import Foundation

enum Position: String {
    case  tank, damage, support
}

//1. Struct

struct Hero {
    let name: String
    var position : Position
    var playTime : Double = 0.0

    mutating func newSeason() {
        playTime = 0.0
    }
}

var rudyPlayed: [Hero] = []
rudyPlayed.append(Hero(name: "Tracer", position: .damage, playTime: 3.4))

let solePlayed : [Hero] = [Hero(name: "Soldier", position: .damage, playTime: 1.34)] 
// solePlayed.append(Hero(name: "Soldier", position: .damage, playTime: 1.34)) // struct가 let으로 선언되면 수정 X
// solePlayed[0].name = "Venture"     // 내부 내용 수정 불가
// sosolePlayedle[0].newSeason();         // mutating 함수로도 내용 수정 불가

// 2. Class

class Coordinate {
    // Type Property
    static let defaultUnit = "meters"
    static let maxBounds = Coordinate(x: 1000, y: 1000)
    static let minBounds = Coordinate(x: -1000, y: -1000)

    // Stored Property
    var x: Int = 0 // default value
    var y: Int

    // Initializer
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }

    // User Defined Initializer
    init(x : Int) {
        self.x = x
        y = 10 // initial value
    }

    // Computed Property
    var oposite: Coordinate {
        get {
            return Coordinate(x : -x, y: -y)
        }
        set(oposite) { // 같은 자료형의 인스턴스를 할당해주어야 한다.
            x = -oposite.x
            y = -oposite.y
        }
    }

    var xIntercept: Coordinate {
        get {
            return Coordinate(x : x, y: y)
        }
        set(xIntercept) {
            self.y = 0
        }
    }

    // Method

    // Instance Method
    func printCoordinate() {
        print("Coordinate (\(x), \(y))")
    }

    deinit {
        print("Coordinate (\(x), \(y)) deinitialized")
    }
}

let PointA : Coordinate = Coordinate(x: 10, y: 20)

PointA.printCoordinate()
PointA.oposite = PointA
PointA.printCoordinate()
PointA.xIntercept = PointA
PointA.printCoordinate()