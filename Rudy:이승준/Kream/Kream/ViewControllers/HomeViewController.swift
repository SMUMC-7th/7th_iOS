
import UIKit
import SnapKit

class HomeViewController: UIViewController, UICollectionViewDelegate {
    
    let homeView = HomeView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = homeView
        homeView.categoryCollectionView.tag = 0
        homeView.justDroppedCollectionView.tag = 1
        homeView.challengeCollectionView.tag = 2
        
        setupAction()
        setUpDelegate()
    }
    
    private func setupAction() {
        homeView.segmentedControl.addTarget(
            self,
            action: #selector(segmentedControlValueChanged(segment:)),
            for: .valueChanged
        )
    }
    
    private func setUpDelegate() {
        homeView.categoryCollectionView.delegate = self
        homeView.categoryCollectionView.dataSource = self
        
        homeView.justDroppedCollectionView.delegate = self
        homeView.justDroppedCollectionView.dataSource = self
        
        homeView.challengeCollectionView.delegate = self
        homeView.challengeCollectionView.dataSource = self
    }
    
    // SegmentedControl의 버튼을 눌렀을 때, 호출되는 함수 구현
    @objc private func segmentedControlValueChanged(segment: UISegmentedControl) {
    let selectedSegmentIndex = homeView.segmentedControl.selectedSegmentIndex                 // 세그먼트의 인덱스값 가져옴
    let selectedSegmentFrame = homeView.segmentedControl.subviews[selectedSegmentIndex].frame // 선택된 세그먼트의 프레임 가져옴

    // 세그먼트의 텍스트 가져오기
    let segmentTitle = homeView.segmentedControl.titleForSegment(at: selectedSegmentIndex) ?? ""
    
    // 텍스트 크기 계산 (세그먼트에 설정된 폰트와 동일한 속성 사용)
    let textAttributes: [NSAttributedString.Key: Any] = [
        .font: UIFont.systemFont(ofSize: 16, weight: .bold)
    ]
    
    let textWidth = (segmentTitle as NSString).size(withAttributes: textAttributes).width // 텍스트 너비 계산
    
    // 세그먼트 프레임 안에서 텍스트 시작점 계산
    let segmentWidth = selectedSegmentFrame.width
    let textStartX = (segmentWidth - textWidth) / 2 // 세그먼트 내 텍스트 시작점 (중앙에서 텍스트 길이의 절반 만큼 왼쪽으로 이동)

    // 세그먼트의 시작점에 텍스트 시작점을 더한 값이 underLineView의 정확한 시작점이 됨
    let leadingDistance = selectedSegmentFrame.origin.x + textStartX
    
    self.homeView.setUnderline(leadingDistance: leadingDistance, textWidth: textWidth + 1)
}
    
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if (collectionView.tag == 0) {
            return HomeCategoryModel.data.count
        } else if (collectionView.tag == 1) {
            return SavedProducts.just.count
        } else if (collectionView.tag == 2) {
            return ChallengeModel.data.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (collectionView.tag == 0) {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: HomeCategoryCollectionViewCell.identifier, for: indexPath) as? HomeCategoryCollectionViewCell
            else {
                return UICollectionViewCell()
            }
            let data = HomeCategoryModel.data[indexPath.row]
            cell.configuration(data: data)
            return cell
        }
        if (collectionView.tag == 1) {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: JustDroppedCollectionViewCell.identifier, for: indexPath) as? JustDroppedCollectionViewCell
            else {
                return UICollectionViewCell()
            }
            let data = SavedProducts.just[indexPath.row]
            cell.configuration(data: data)
            return cell
        }
        if (collectionView.tag == 2) {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ChallengeCollectionViewCell.identifier, for: indexPath) as? ChallengeCollectionViewCell
            else {
                return UICollectionViewCell()
            }
            let data = ChallengeModel.data[indexPath.row]
            cell.configuration(data: data)
            return cell
        }
        return UICollectionViewCell()
    }
}

