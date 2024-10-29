//
//  HomeView.swift
//  Kream
//
//  Created by 이승준 on 10/26/24.
//

import UIKit
import SnapKit

class HomeView: UIView {
    
    //MARK: - Top Area : Search & Notification
    private var topViewContainer: UIView = {
        let view = UIView()
        return view
    }()
    
    public var searchBarButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "HomeSearchBarBackground")
        button.setTitle("브랜드, 상품, 프로필, 태그 등", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 13.5)
        button.layer.cornerRadius = 12
        button.contentHorizontalAlignment = .left
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
        return button
    }()
    
    public var alarmButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Bell Icon"), for: .normal)
        button.tintColor = .black
        button.contentMode = .scaleAspectFit
        return button
    }()
    
    //MARK: - SegmentControl, Underline
    let segmentedControl: UISegmentedControl = {
        let seg = UISegmentedControl(items: ["추천", "랭킹", "발매정보", "럭셔리", "남성", "여성"])
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 8 // 원하는 줄 간격 설정
        paragraphStyle.alignment = .center // 텍스트 정렬 설정
        
        // 배경과 구분선 이미지 제거
        seg.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        seg.setBackgroundImage(UIImage(), for: .selected, barMetrics: .default)
        seg.setBackgroundImage(UIImage(), for: .highlighted, barMetrics: .default)
        seg.setDividerImage(UIImage(), forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
        seg.apportionsSegmentWidthsByContent = true
        
        seg.selectedSegmentIndex = 0
        
        // 기본 상태 텍스트 속성 설정
        seg.setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: UIColor.black,
                .font: UIFont.systemFont(ofSize: 16, weight: .light),
                .kern: -2,
                .paragraphStyle: paragraphStyle,
            ],
            for: .normal
        )
        
        // 선택된 상태 텍스트 속성 설정 (볼드체 및 밑줄 추가)
        seg.setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: UIColor.black,
                .font: UIFont.systemFont(ofSize: 16, weight: .bold),
                .kern: -2,
                .paragraphStyle: paragraphStyle,
                //.underlineStyle: NSUnderlineStyle.single.rawValue, // 밑줄 추가
            ],
            for: .selected
        )
        
        // 텍스트 속성 간의 간격 조절
        
        
        return seg
    }()
    
    public var underLine: UIView = {
        let line = UIView()
        line.backgroundColor = .black
        return line
    }()
    
    // MARK: RecomendationView : Ad, CategoryCollectionViews
    public var recomendationViewContainer: UIView = {
        let view = UIView()
        //view.backgroundColor = .darkGray
        return view
    }()
    
    private var adImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "Advertisement")
        return image
    }()
    
    public var collectionView : UICollectionView = {
        let flow = UICollectionViewFlowLayout()
        flow.estimatedItemSize = .init(width: 61, height: 81)
        flow.minimumInteritemSpacing = 12
        flow.minimumLineSpacing = 20
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: flow)
        collection.backgroundColor = .clear
        collection.isScrollEnabled = false
        collection.register(HomeCategoryCollectionViewCell.self,
                            forCellWithReuseIdentifier: HomeCategoryCollectionViewCell.identifier)
        
        return collection
    }()
    
    private var collectionViewBottomLine: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor(named: "BottomLine")
        return line
    }()
    
    private var tabBarline: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor(named: "BottomLine")
        return line
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()
    }
    
    private func addComponents() {
                
        self.addSubview(segmentedControl)
        self.addSubview(recomendationViewContainer)
        
        recomendationViewContainer.addSubview(adImageView)
        recomendationViewContainer.addSubview(collectionView)
        recomendationViewContainer.addSubview(collectionViewBottomLine)
        
        self.addSubview(tabBarline)
        self.addSubview(topViewContainer)
        
        topViewContainer.addSubview(searchBarButton)
        topViewContainer.addSubview(alarmButton)
        
        topViewContainer.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(60)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(40)
        }
        
        searchBarButton.snp.makeConstraints { make in
            make.top.bottom.leading.equalToSuperview()
        }
        
        alarmButton.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(8)
            make.height.width.equalTo(24)
            make.leading.equalTo(searchBarButton.snp.trailing).offset(10)
            make.trailing.equalTo(0)
        }
        
        self.addSubview(segmentedControl)
        self.addSubview(underLine)
        
        segmentedControl.snp.makeConstraints { make in
            make.top.equalTo(topViewContainer.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(27)
        }
        
        underLine.snp.makeConstraints { make in
            make.top.equalTo(segmentedControl.snp.bottom)
            make.height.equalTo(2)
            make.leading.equalTo(14.66) // 확인용, 지워야됨
            make.width.equalTo(25.68)
        }
        
        self.addSubview(recomendationViewContainer)
        
        recomendationViewContainer.addSubview(adImageView)
        recomendationViewContainer.addSubview(collectionView)
        recomendationViewContainer.addSubview(collectionViewBottomLine)
        
        recomendationViewContainer.snp.makeConstraints { make in
            make.top.equalTo(underLine.snp.bottom).inset(-1)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(self.safeAreaLayoutGuide).offset(-5)
        }
        
        adImageView.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview()
            make.top.equalTo(recomendationViewContainer.snp.top).inset(8)
            make.height.equalTo(336)
        }
        
        collectionView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.top.equalTo(adImageView.snp.bottom).offset(40)
            make.height.equalTo(182)
        }
        
        collectionViewBottomLine.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview()
            make.height.equalTo(2)
            make.top.equalTo(collectionView.snp.bottom).offset(40)
        }
        
        tabBarline.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(recomendationViewContainer.snp.bottom).offset(-10)
            make.height.equalTo(1)
        }
        
    }
    
    public func setUnderline(leadingDistance: CGFloat, textWidth: CGFloat) {
        underLine.snp.removeConstraints()
        underLine.snp.makeConstraints { make in
            make.top.equalTo(segmentedControl.snp.bottom)
            make.height.equalTo(2)
            make.leading.equalTo(leadingDistance)
            make.width.equalTo(textWidth)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

import SwiftUI
#Preview{
    TabBarViewController()
}
