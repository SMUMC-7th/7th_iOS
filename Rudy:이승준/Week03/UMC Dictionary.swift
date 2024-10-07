// 1. 학생들의 점수 딕셔너리 선언
var scores: [String : Int] = ["Alice" : 100, "Bob" : 100, "Min" : 90]

// 2. “Alice”의 점수를 95점으로 수정
scores["Alice"] = 95

// 3. “Bob”의 점수를 삭제하고, 남은 학생들의 점수를 출력
scores["Bob"] = nil
scores.removeValue(forKey: "Bob")

for (name, score) in scores {
	print("\(name)'s score is \(score)")
}