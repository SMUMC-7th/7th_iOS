import UIKit
import SnapKit

class TeenipingViewController: UIViewController {
    private let rootView = TeenipingView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = rootView
        
        setupAction()
        setupDelegate()
    }
    
    private func setupAction() {
        rootView.segmentedControl.addTarget(
            self,
            action: #selector(segmentedControlValueChanged(segment:)),
            for: .valueChanged
        )
    }
    
    private func setupDelegate() {
        rootView.teenipingCollectionView.dataSource = self
    }

    //인덱스값이 업데이트 되었을때 어떤 컴포넌트가 표시할지 처리하는 메서드
    @objc
    private func segmentedControlValueChanged(segment:  UISegmentedControl) {// 매개변수로 해당 segment 받아오기
        if segment.selectedSegmentIndex == 0 {
            rootView.teenipingCollectionView.isHidden = false
            rootView.emptyLabel.isHidden = true
        } else {
            rootView.teenipingCollectionView.isHidden = true
            rootView.emptyLabel.isHidden = false
        }
    }
}

extension TeenipingViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return TeenipingModel.dummy().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: TeenipingCollectionViewCell.identifier,
            for: indexPath
        ) as? TeenipingCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let list = TeenipingModel.dummy()
        
        cell.imageView.image = list[indexPath.row].image
        cell.titleLabel.text = list[indexPath.row].name
        
        return cell
    }
}
