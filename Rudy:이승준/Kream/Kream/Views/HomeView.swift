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
    
    public var segmentedControlUnderline: UIView = {
        let line = UIView()
        line.backgroundColor = .black
        return line
    }()
    
    //MARK: - ScrollView
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = true // 세로 스크롤바 보임
        scrollView.showsHorizontalScrollIndicator = false // 가로 스크롤바 안보임
        scrollView.contentSize.width = 150
        return scrollView
    }()
    
    // MARK: : Ad, CategoryCollectionViews
    private var adImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "Advertisement")
        return image
    }()
    
    public var categoryCollectionView : UICollectionView = {
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
    
    private var justDroppedTitle: UILabel = {
        let label = UILabel()
        label.text = "Just Dropped"
        label.font = .systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    private var justDroppedSubTitle: UILabel = {
        let label = UILabel()
        label.text = "발매 상품"
        label.font = .systemFont(ofSize: 13)
        label.textColor = .subtitle
        return label
    }()
    
    public lazy var justDroppedCollectionView: UICollectionView = {
        let flow = UICollectionViewFlowLayout()
        flow.estimatedItemSize = CGSize(width: 142, height: 237)
        flow.minimumLineSpacing = 8
        flow.scrollDirection = .horizontal
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: flow)
        collection.backgroundColor = .clear
        collection.isScrollEnabled = true
        collection.showsHorizontalScrollIndicator = false
        collection.register(JustDroppedCollectionViewCell.self, forCellWithReuseIdentifier: JustDroppedCollectionViewCell.identifier)
        return collection
    }()
    
    private lazy var justDroppedBottomLine: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor(named: "BottomLine")
        return line
    }()
    
    private var challengeTitle: UILabel = {
        let label = UILabel()
        label.text = "본격 한파대비! 연말 필수템 모음"
        label.font = .systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    private var challengeSubTitle: UILabel = {
        let label = UILabel()
        label.text = "#해피홀리룩챌린지"
        label.font = .systemFont(ofSize: 13)
        label.textColor = .subtitle
        return label
    }()
    
    public lazy var challengeCollectionView: UICollectionView = {
        let flow = UICollectionViewFlowLayout()
        flow.estimatedItemSize = CGSize(width: 142, height: 237)
        flow.minimumInteritemSpacing = 12
        flow.minimumLineSpacing = 8
        flow.scrollDirection = .horizontal
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: flow)
        collection.backgroundColor = .clear
        collection.isScrollEnabled = true
        collection.showsHorizontalScrollIndicator = false
        collection.register(ChallengeCollectionViewCell.self, forCellWithReuseIdentifier: ChallengeCollectionViewCell.identifier)
        return collection
    }()
    
    private lazy var challengeBottomLine: UIView = {
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
        self.addTopComponents()
        self.addSegmentedComponent()
        self.addScrollComponents()
        self.addJustDroppedComponents()
        self.addChallengeComponents()
        self.addTabBarLine()
    }
    
    private func addTopComponents() {
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
    }
    
    private func addSegmentedComponent() {
        self.addSubview(segmentedControl)
        self.addSubview(segmentedControlUnderline)
        
        segmentedControl.snp.makeConstraints { make in
            make.top.equalTo(topViewContainer.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(27)
        }
        
        segmentedControlUnderline.snp.makeConstraints { make in
            make.top.equalTo(segmentedControl.snp.bottom)
            make.height.equalTo(2)
            make.leading.equalTo(14.66) // 확인용, 지워야됨
            make.width.equalTo(25.68)
        }
    }
    
    private func addScrollComponents() {
        
        self.addSubview(scrollView)
        
        //MARK: ScrollView
        
        scrollView.addSubview(adImageView)
        scrollView.addSubview(categoryCollectionView)
        scrollView.addSubview(collectionViewBottomLine)
        
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(segmentedControl.snp.bottom).offset(5)
            make.leading.trailing.bottom.equalTo(self.safeAreaLayoutGuide)
        }
        
        adImageView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(scrollView.snp.top).inset(8)
            make.width.equalTo(self.snp.width)
            make.height.equalTo(366)
        }
        
        categoryCollectionView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.top.equalTo(adImageView.snp.bottom).offset(10)
            make.height.equalTo(182)
        }
        
        collectionViewBottomLine.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview()
            make.height.equalTo(2)
            make.top.equalTo(categoryCollectionView.snp.bottom).offset(30)
        }
    }
    
    private func addJustDroppedComponents() {
        
        scrollView.addSubview(justDroppedTitle)
        scrollView.addSubview(justDroppedSubTitle)
        scrollView.addSubview(justDroppedCollectionView)
        scrollView.addSubview(justDroppedBottomLine)
        
        justDroppedTitle.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(16)
            make.top.equalTo(collectionViewBottomLine.snp.bottom).inset(-20)
        }
        
        justDroppedSubTitle.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(16)
            make.top.equalTo(justDroppedTitle.snp.bottom).offset(4)
        }
        
        justDroppedCollectionView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(justDroppedSubTitle.snp.bottom).offset(14)
            make.bottom.equalTo(justDroppedBottomLine.snp.top).inset(-10)
            make.height.equalTo(257)
        }
        
        justDroppedBottomLine.snp.makeConstraints { make in
            make.top.equalTo(justDroppedCollectionView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(2)
        }
    }
    
    private func addChallengeComponents() {
        scrollView.addSubview(challengeTitle)
        scrollView.addSubview(challengeSubTitle)
        scrollView.addSubview(challengeCollectionView)
        scrollView.addSubview(challengeBottomLine)
        
        challengeTitle.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(16)
            make.top.equalTo(justDroppedBottomLine.snp.bottom).inset(-20)
        }
        
        challengeSubTitle.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(16)
            make.top.equalTo(challengeTitle.snp.bottom).offset(4)
        }
        
        challengeCollectionView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(challengeSubTitle.snp.bottom).offset(14)
            make.bottom.equalTo(challengeBottomLine.snp.top).inset(-10)
            make.height.equalTo(257)
        }
        
        challengeBottomLine.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(-10)
            make.height.equalTo(2)
        }
        
    }
    
    private func addTabBarLine() {
//        self.addSubview(tabBarline)
//        
//        tabBarline.snp.makeConstraints { make in
//            make.leading.trailing.equalToSuperview()
//            make.bottom.equalTo(self.safeAreaLayoutGuide).offset(-10)
//            make.height.equalTo(1)
//        }
    }
    
    public func setUnderline(leadingDistance: CGFloat, textWidth: CGFloat) {
        segmentedControlUnderline.snp.removeConstraints()
        segmentedControlUnderline.snp.makeConstraints { make in
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
