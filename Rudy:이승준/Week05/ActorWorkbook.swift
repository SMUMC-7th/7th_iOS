// 내부 상태에 대한 단일 접근 보장!!
// single access guarantee

// 문제: 데이터 경쟁 문제
// 해결: 한 번에 한 쓰레드만 접근 가능

// Actor
// 1. 단일 접근 보장
// 2. Actor의 속성이나, 메서드에 접근할 때는 await 키워드를 사용하여 비동기적으로 접근해야 함

actor Counter {
    var value = 0
    
    func increment() {
        value += 1
    }

    func getValue() -> Int {
        return value
    }
}

// Actor의 동작 원리
// 

let counter = Counter()

Task {
    await counter.increment()
    let currentValue = await counter.getValue()
    print("Current value: \(currentValue)") // "Current value: 1"
}

class UnsafeCounter {
    var value = 0
    
    func increment() {
        value += 1
    }
}

let unsafeCounter = UnsafeCounter()
DispatchQueue.global().async {
    for _ in 0..<1000 {
        counter.increment() // 여러 스레드에서 동시에 접근, 데이터 경쟁 발생
    }
}

Task {
    for _ in 0..<1000 {
        await counter.increment() // 안전한 접근, 데이터 경쟁 방지
        // await : 비동기 메서드 호출을 위해
    }
}

