//
//  MainHomeView.swift
//  kream
//
//  Created by 유시은 on 10/25/24.
//

import UIKit
import Then

class MainHomeView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Main화면 상단 segmentedControl
    let mainSegmentedControl = UISegmentedControl(items: ["추천", "랭킹", "발매정보", "럭셔리", "남성", "여성"]).then {
        // .normal, .selected, .highlighted 뒷배경 없애기 위해
        // setBackgroundImage()를 UIImage()로 설정
        $0.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        $0.setBackgroundImage(UIImage(), for: .selected, barMetrics: .default)
        $0.setBackgroundImage(UIImage(), for: .highlighted, barMetrics: .default)
        $0.setDividerImage(UIImage(), forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
        // 초기화면은 0번 인덱스(추천) 선택되도록 설정
        $0.selectedSegmentIndex = 0

        // 선택되지 않은 새그먼트 글씨체 굵기 얇게
        $0.setTitleTextAttributes(
            [
                NSAttributedString.Key.foregroundColor: UIColor.black,
                .font: UIFont.systemFont(ofSize: 16, weight: .light)
            ],
            for: .normal
        )
        
        // 새그먼트 클릭하면 글씨체 굵게
        $0.setTitleTextAttributes(
            [
                NSAttributedString.Key.foregroundColor: UIColor.black,
                .font: UIFont.systemFont(ofSize: 16, weight: .bold)
            ],
            for: .selected
        )
        
        // 각 세그먼트의 간격을 동일하게 맞춤
        $0.apportionsSegmentWidthsByContent = true
    }
    
    // 추천 탭 CollectionView
    let recommendCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        // 각 셀의 사이즈
        $0.estimatedItemSize = .init(width: 61, height: 81)
        // 각 행 사이의 최소 간격
        $0.minimumLineSpacing = 20
    }).then {
        $0.backgroundColor = .clear
        // 데이터 10개 한 화면안에 다 들어오므로 scroll 불가능하게
        $0.isScrollEnabled = false
        $0.register(RecommendCollectionViewCell.self, forCellWithReuseIdentifier: RecommendCollectionViewCell.identifier)
    }
    
    // MainHomeViewController에서 각 Label들의 속성인 isHiddend에 접근하기 위해
    // 접근제어자 public으로 설정
    public let rankingLabel = UILabel().then {
        $0.text = "랭킹"
        $0.isHidden = true
    }
    
    public let releaseInformationLabel = UILabel().then {
        $0.text = "발매정보"
        $0.isHidden = true
    }
    
    public let luxuryLabel = UILabel().then {
        $0.text = "럭셔리"
        $0.isHidden = true
    }
    
    public let maleLabel = UILabel().then {
        $0.text = "남성"
        $0.isHidden = true
    }
    
    public let femaleLabel = UILabel().then {
        $0.text = "여성"
        $0.isHidden = true
    }
    
    // 검색 창 눌렀을 때 어디로 넘어가는 것인지?
    public lazy var mainSearchTextField = UITextField().then {
        $0.placeholder = "브랜드, 상품, 프로필, 태그 등"
        $0.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 8.0, height: 0.0))
        $0.leftViewMode = .always
        $0.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0) // #F5F5F5 색상 적용
        $0.layer.cornerRadius = 10.0 // 모서리를 둥글게
    }
    
    private lazy var alertImage = UIImageView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFit
        $0.image = UIImage(named: "alert")
    }
    
    public lazy var homeImage = UIImageView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFit
        $0.image = UIImage(named: "homeImage")
    }
    
    private func addComponents() {
        // forEach문 활용해 컴포넌트들을 한번에 addSubview함
        [
            mainSearchTextField,
            alertImage,
            mainSegmentedControl,
            homeImage,
            recommendCollectionView,
            rankingLabel,
            releaseInformationLabel,
            luxuryLabel,
            maleLabel,
            femaleLabel
        ].forEach {
            addSubview($0)
        }
        
        mainSearchTextField.snp.makeConstraints {
            // 피그마에 명시된 숫자대로 하니까 맞지 않음, 다시 하기
            $0.top.equalToSuperview().offset(60)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-55)
            $0.width.equalTo(303)
            $0.height.equalTo(40)
        }
        
        alertImage.snp.makeConstraints {
            $0.top.equalTo(mainSearchTextField.snp.top).offset(8)
            $0.leading.equalTo(mainSearchTextField.snp.trailing).offset(15)
            $0.width.height.equalTo(24)
        }
        
        // ["추천", "랭킹", "발매정보", "럭셔리", "남성", "여성"]
        mainSegmentedControl.snp.makeConstraints {
            $0.top.equalTo(mainSearchTextField.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(24) // 좌우 여백
            $0.height.equalTo(27)
            $0.centerX.equalToSuperview()
        }
        
        homeImage.snp.makeConstraints {
            // offset 0으로 했을때 안되는 이유가 무엇인지? 다시 맞추기
            $0.top.equalTo(mainSegmentedControl.snp.bottom).inset(150)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        
        recommendCollectionView.snp.makeConstraints {
            $0.top.equalTo(homeImage.snp.bottom).offset(-130)
            
            //$0.top.equalToSuperview().offset(300)
            $0.horizontalEdges.equalToSuperview().inset(19)
            $0.bottom.equalToSuperview().inset(74)
        }
        
        rankingLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
               
        releaseInformationLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
        
        luxuryLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
        
        maleLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
        
        femaleLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
    }
}

import SwiftUI
#Preview
{
    MainViewController()
}
