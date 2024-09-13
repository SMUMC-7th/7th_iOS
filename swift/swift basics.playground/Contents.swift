// 1. 주석

// 한 줄 주석
/*
 여러줄
 주석
 */

// 2. 변수
let const = 0
// const = 1 // Error 발생 : 상수이기 때문에 변경 불가능
var variable = 10
// var variable = 20 // Error 이미 선언된 이름으로는 선언 불가
variable = 30

// 3. 자료형
// 3.1. Basics : Int, String, Bool, Double, Float, Character
// var number // Error : Type annotation missing in pattern, swift는 강타입 언어이기 때문에 반드시 Type Annotation 해주어야 한다.
var number: Int
var double: Double = 10.0

// Type Inference : 타입을 추론할 수 있다.
var multipleLines = """
    1.
    2.
    3.
"""

// 3.2 Careful : Any, AnyObject, nil
// Any : 무엇이든지 할당할 수 있다.
var someVar : Any = "This is String"
someVar = 50 //Int
someVar = 10.14 //Double
type(of: someVar) // Double
// let someDouble: Double = someVar //Compile Error : Cannot convert value of type 'Any' to specified type 'Double'
// 요약) Any를 지정된 형으로 변환할 수 없다.
// 그런데, 데이터 타입을 출력할 때, 어떤 값이 할당되었을 때는 값에 해당하는 데이터 타입이 나온다.??
// 원리) 지정된 값의 런타임 타입으로 바뀐다.

// AnyObject : 아무 Reference Type으로 바뀔 수 있다. (제한된 범위)

// 연산자

// ++이 없다.

// 조건문

if (true) {
    
} else if (true) {
    
// } else if (1) {// Error : 반드시 Booean Type이 와야 한다.
    
}

var footballClub: String = ""

switch (footballClub) {
case "Liverpool" :
    break
case ("Some Clubs"):
    break
default:
    "Nothing"
}

// 3.3 Protocol : some : 지정된 protocol에 따르는 타입이 반환된다.
let aVar : some Equatable = 10

// 반복문
while false {
    
}

for i in 0...1 /* Iterator */ {
    
}
// 함수
// 시그니처 : fucn Name((External parameterName) parameterName: Type) -> Return Type { body }

// 옵셔널
let num1 : Int? = 10

print(num1)  //
print(num1!) // Forced Unwrapping

if let binded = num1 { // Optional Binding
    
}

guard let g = num1 else {
    print("nil")
    fatalError("num1 is nil") // 또는 다른 적절한 에러 처리 방법 사용
}

print("Unwrapped value: \(g)")
