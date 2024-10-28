//
//  MainHomeViewController.swift
//  kream
//
//  Created by 유시은 on 10/1/24.
//

import UIKit
import SnapKit

class MainHomeViewController: UIViewController {
    
    private lazy var mainHomeView : MainHomeView = {
        let mainHomeView = MainHomeView()
        
        return mainHomeView
    }()
    
    private lazy var underlineView: UIView = {
        let view = UIView()
        view.backgroundColor = .black // 밑줄 색상 설정
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view = mainHomeView
        
        setupAction()
        setupDelegate()
        setupUnderline()
    }
    
    // addTarget을 연결할 setupAction() 메서드를 선언하고
    // segmentedControl의 인덱스가 바뀌었을 때(.valueChanged) 실행될
    // mainSegmentedConrollValueChanged() 연결
    private func setupAction() {
        mainHomeView.mainSegmentedControl.addTarget(
            self,
            action: #selector(mainSegmentedConrollValueChanged(segment:)),
            for: .valueChanged)
    }
    
    // 데이터 바인딩
    private func setupDelegate() {
        mainHomeView.recommendCollectionView.dataSource = self
    }
    
    // 밑줄 뷰를 추가하고 제약 설정함
    private func setupUnderline() {
        mainHomeView.addSubview(underlineView)
        
        underlineView.snp.makeConstraints {
            $0.height.equalTo(2) // 밑줄 두께
            $0.bottom.equalTo(mainHomeView.mainSegmentedControl.snp.bottom).offset(8) //새그먼트 아래쪽에 위치
            $0.width.equalTo(mainHomeView.mainSegmentedControl.snp.width).dividedBy(mainHomeView.mainSegmentedControl.numberOfSegments)
            $0.leading.equalTo(mainHomeView.mainSegmentedControl.snp.leading)
        }
        
        // 초기 선택된 세그먼트(0번)의 텍스트 밑에 밑줄 설정
        updateUnderlinePosition(for: 0)
    }
    
    // UISegmentedControl의 인덱스 값이 업데이트 되었을 때 실행될 메서드를 선언함
    // 매개변수로 UISegmentedControl의 해당 segment를 받아옴
    @objc
    private func mainSegmentedConrollValueChanged(segment: UISegmentedControl) {
        // 가독성을 위해 if-else문에서 switch 문으로 변경함
        // 모든 레이블과 뷰를 숨김
        func hideAllViews() {
            mainHomeView.homeImage.isHidden = true
            mainHomeView.recommendCollectionView.isHidden = true
            mainHomeView.rankingLabel.isHidden = true
            mainHomeView.releaseInformationLabel.isHidden = true
            mainHomeView.luxuryLabel.isHidden = true
            mainHomeView.maleLabel.isHidden = true
            mainHomeView.femaleLabel.isHidden = true
        }

        // 선택된 세그먼트 인덱스에 따라 표시할 뷰 결정
        hideAllViews() // 먼저 모든 뷰를 숨기고 필요한 뷰만 보여줌

        switch segment.selectedSegmentIndex {
        case 0:
            mainHomeView.homeImage.isHidden = false
            mainHomeView.recommendCollectionView.isHidden = false
        case 1:
            mainHomeView.rankingLabel.isHidden = false
        case 2:
            mainHomeView.releaseInformationLabel.isHidden = false
        case 3:
            mainHomeView.luxuryLabel.isHidden = false
        case 4:
            mainHomeView.maleLabel.isHidden = false
        case 5:
            mainHomeView.femaleLabel.isHidden = false
        default:
            break 
        }
    }
    
    @objc private func mainSegmentedControlValueChanged(segment: UISegmentedControl) {
            updateUnderlinePosition(for: segment.selectedSegmentIndex)
        }

    private func updateUnderlinePosition(for index: Int) {
        guard let title = mainHomeView.mainSegmentedControl.titleForSegment(at: index) else { return }

            // 선택된 세그먼트의 텍스트 너비 계산
            let font = UIFont.systemFont(ofSize: 16, weight: .bold) // 세그먼트에 사용된 폰트와 동일하게 설정
            let attributes = [NSAttributedString.Key.font: font]
            let textWidth = (title as NSString).size(withAttributes: attributes).width

            // 세그먼트의 시작 위치 계산
            let segmentWidth = mainHomeView.mainSegmentedControl.frame.width / CGFloat(mainHomeView.mainSegmentedControl.numberOfSegments)
            let leadingOffset = (segmentWidth * CGFloat(index)) + (segmentWidth - textWidth) / 2

            // 밑줄의 위치와 너비 업데이트
            UIView.animate(withDuration: 0.3) {
                self.underlineView.snp.remakeConstraints { make in
                    make.height.equalTo(2) // 밑줄 두께
                    make.bottom.equalTo(self.mainHomeView.mainSegmentedControl.snp.bottom)
                    make.width.equalTo(textWidth) // 텍스트 너비에 맞게 설정
                    make.leading.equalTo(self.mainHomeView.mainSegmentedControl.snp.leading).offset(leadingOffset)
                }
                self.view.layoutIfNeeded()
            }
        }
}

// UICollectionViewDataSource 프로토콜에서 기본적으로 구현해야 하는 두개의 메소드
extension MainHomeViewController: UICollectionViewDataSource {
    // numberOfItemsInSection 메서드는 해당 CollectionView에 몇개의 데이터가 들어갈지
    // Int 타입의 변수로 반환함
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return RecommendModel.dummy().count
    }
    
    // cell을 선언한 후 데이터를 바인딩하고 바인딩 된 셀을 반환함
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell =
        // dequeueReusableCell() : 재사용 큐에서 필요한 cell을 dequeue하는 함수
        // 재사용 큐에서는 식별자를 통해 셀을 구분함
        // 구분을 위해 withReuseIdentifier를 받음
        // 행 식별을 위해 indexPath도 매개변수로 받음
        collectionView.dequeueReusableCell(withReuseIdentifier: RecommendCollectionViewCell.identifier, for: indexPath) as? RecommendCollectionViewCell
        // 만약 cell의 값이 nil일 경우 UICollectionViewCell을 반환함
        else {
            return UICollectionViewCell()
        }
        
        // 각 셀의 인덱스에 맞게 RecommendModel.dummy()의 데이터를 바인딩함
        let list = RecommendModel.dummy()
        
        cell.imageView.image = list[indexPath.row].image
        cell.titleLabel.text = list[indexPath.row].name
        
        return cell
    }
}

import SwiftUI
#Preview
{
    MainHomeViewController()
}
