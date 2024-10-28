import UIKit

//func calculateTotalPrice(totalPrice: Int, totalTip: Int) -> Int {
//    return totalPrice + totalTip
//}
//
//let result = calculateTotalPrice(totalPrice: 10000, totalTip: 2000)
//
//print("최종 결제 금액: \(result)원")

//func checkTemperature(temperature: Int) {
//    if temperature < 10 {
//        print("춥다")
//    } else if temperature >= 10 && temperature < 25 {
//        print("적당하다")
//    } else {
//        print("덥다")
//    }
//}
//
//checkTemperature(temperature: 17)

//func printTravelBuget(city: String, days: Int, dailyBudget: Int) {
//    let totalBudget = days * dailyBudget
//    print("\(city)에서의 총 여행 예산은 \(totalBudget)원입니다.")
//}
//
//printTravelBuget(city: "Seoul", days: 2, dailyBudget: 200000)


//func getCurrentDate() -> String {
//    let currentDate = Date()
//    let dateFormatter = DateFormatter()
//    
//    dateFormatter.dateFormat = "yyyy-MM-dd"
//    
//    let formattedDate = dateFormatter.string(from: currentDate)
//    
//    return formattedDate
//}
//
//print("오늘 날짜: \(getCurrentDate())")

let addValue: (Int) -> Int = { number in
    var sum = 0
    for i in 1...number {
        sum += i
    }
    return sum
}

let result = addValue(10) 
print("1부터 10까지의 합은 \(result)입니다.")
