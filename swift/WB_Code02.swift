var x: Int = 5
x += 1
print(x)

let score: Int  = 90
let passed: String = (score > 60) ? "합격" : "불합격"

let day: Int = 3
switch day {
	case 1...5 : 
		print("주중")
	case 6...7 :
		print("주말")
	default :
		print("??")
}