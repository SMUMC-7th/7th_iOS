
import UIKit
import SnapKit

class HomeViewController: UIViewController, UICollectionViewDelegate {
    
    
    let homeView = HomeView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view = homeView
        
        setupAction()
        setUpDelete()
    }
    
    private func setupAction() {
        homeView.segmentedControl.addTarget(
            self,
            action: #selector(segmentedControlValueChanged(segment:)),
            for: .valueChanged
        )
        
    }
    
    private func setUpDelete() {
        homeView.collectionView.delegate = self
        homeView.collectionView.dataSource = self
    }
    
    @objc
    private func segmentedControlValueChanged(segment: UISegmentedControl) {
        
        switch segment.selectedSegmentIndex {
        case 0 :
            print("추천")
        case 1 :
            print("추천")
        case 2 :
            print("발매정보")
        case 3 :
            print("럭셔리")
        case 4 :
            print("남성")
        case 5 :
            print("여성")
        default:
            print("")
        }
    }
    
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return HomeCategoryModel.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: HomeCategoryCollectionViewCell.identifier, for: indexPath) as? HomeCategoryCollectionViewCell
        else {
            return UICollectionViewCell()
        }
        let data = HomeCategoryModel.data[indexPath.row]
        cell.configuration(data: data)
        return cell
    }
}

