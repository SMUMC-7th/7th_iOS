func calculateTotalPrice(price: Int, tip: Int) -> Int {
    return price + tip
}

print(calculateTotalPrice(price: 100,tip: 30))

func checkTemperature(temp: Int){
    switch temp {
        case 20..<30 :
            print("적당하다.")
        case 30... :
            print("덥다")
        default :
            print("춥다.")
    }
}
checkTemperature(temp: 2)

func printTravelBudget(city: String, days: Int, dailyBudget: Int) {
    print("\(city) travel budget is \(days * dailyBudget)")
}

printTravelBudget(city: "Seoul", days: 3, dailyBudget: 300)

import Foundation

func getCurrentDate() {

    let today = Date()

    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"

    let result = dateFormatter.string(from: today)

    print(result)
}

getCurrentDate()