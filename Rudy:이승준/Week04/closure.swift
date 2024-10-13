let addValue = { (num: Int) -> Void in
    var result: Int = 0

    for i in 1...num {
        result += i
    }

    print(result)
}

addValue(10)