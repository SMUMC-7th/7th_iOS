// 1. 네트워크 요청 상태 열거형 정의
enum State {
    case idle
    case requesting
    case success(String)   // 성공 시 관련 데이터를 String으로 전달
    case failure(Error)    // 실패 시 Error 타입의 정보를 전달
}

// 2. 네트워크 요청 상태를 나타내는 변수 선언
let currentState: State = .success("데이터")

// 3. switch문으로 상태에 맞는 출력 작성
switch currentState {
case .idle:
    print("현재 대기 상태입니다.")
case .requesting:
    print("요청 중입니다...")
case .success(let success):
    print("요청 성공: \(success)")
case .failure(let error):
    print("요청 실패: \(error)")
}
