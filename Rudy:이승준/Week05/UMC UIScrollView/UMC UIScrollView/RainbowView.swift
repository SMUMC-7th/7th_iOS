//
//  RainbowView.swift
//  UMC UIScrollView
//
//  Created by 이승준 on 11/3/24.
//

import UIKit
import SnapKit

class RainbowView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupColorViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = true // 세로 스크롤바 보임
        scrollView.showsHorizontalScrollIndicator = false // 가로 스크롤바 안보임
        return scrollView
    }()
    
    private func setupView() {
        self.addSubview(scrollView)
        scrollView.snp.makeConstraints {
            $0.edges.equalTo(self.safeAreaLayoutGuide) // snp 아닌데 이게 가능하다고??
        }
    }
    
    private func setupColorViews() {
        var previousView: UIView? = nil
        
        for color in RainbowColors.colors { //
            let colorView = UIView()          //
            colorView.backgroundColor = color //
            scrollView.addSubview(colorView)  // scrollView 안에 서브뷰를 만듬
            
            colorView.snp.makeConstraints {
                $0.left.right.equalToSuperview() // 좌우로 스크롤 없이 화면 크기에 맞춤
                $0.width.equalTo(self.snp.width) // 현재 RainbowView의 너비 값
                $0.height.equalTo(176)
                
                
                if let previousView = previousView { // 이전 뷰가 존재하면 그 뷰 bottom에 연결
                    $0.top.equalTo(previousView.snp.bottom) // 이전 뷰의 하단에 배치
                } else { // 없다? => 첫 번째 뷰이다.
                    $0.top.equalToSuperview() // superView인 self? 의 상단에 배치
                }
            }
            
            previousView = colorView // 지금이 다음의 이전이다.
        }
        
        // 반복문 종료
        if let lastView = previousView {    // 마지막 뷰
            lastView.snp.makeConstraints {  // 마지막 뷰는 superView의 하단에 고정
                $0.bottom.equalToSuperview()
            }
        }
    }
}

import SwiftUI

#Preview {
    ViewController()
}
