//
//  ViewController.swift
//  Communication_Capsule
//
//  Created by 이승준 on 11/8/24.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    let accessToken = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhcHBsZUBnbWFpbC5jb20iLCJyb2xlIjoiIiwiaWF0IjoxNzMxMjE1Njc3LCJleHAiOjE3MzEyMTkyNzd9.xGNg2eFrTfyM0lqJxBjGgWObj93AIBwf6a1PDZ1FFTU"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        LoginManager.shared.login(email: "rofx@gmail.com", password: "123456") { result in }
//        TimeCapsuleService.shared.fetchTimeCapsules(accessToken: accessToken) { result in
//            switch result {
//            case .success(let timeCapsules):
//                print("타임캡슐 조회 성공: \(timeCapsules)")
//                // 여기서 UI 업데이트 등의 작업을 수행합니다.
//            case .failure(let error):
//                print("타임캡슐 조회 실패: \(error.localizedDescription)")
//                // 에러 처리를 수행합니다.
//            }
//        }
    }

}
