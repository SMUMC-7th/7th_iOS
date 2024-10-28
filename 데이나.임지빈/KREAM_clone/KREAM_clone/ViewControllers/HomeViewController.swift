import UIKit
import SnapKit

class HomeViewController: UIViewController, UICollectionViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = homeview
        setupAction()
        setUpDelegate()
    }
    
    //
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //collectionview에 몇개의 데이터가 들어갈지 반환해주는거 model dummy에 있는ㄱ ㅐ갯수만큼
        return HomeModel.dummy().count
    }
    //어떤 내용이 구현될지 표시하는 cellForItemAt
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //cell이 nil이면 UICollectionViewCell 반환, 재사용 큐
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier, for: indexPath) as? HomeCollectionViewCell else {
            return UICollectionViewCell()
        }
        //dummy 데이터 바인딩
        let list = HomeModel.dummy()
        cell.imageView.image = list[indexPath.row].image
        cell.titleLabel.text = list[indexPath.row].name
        
        return cell
    }
    
    
    private let label = UILabel()
    private let button = UIButton()
    
    private lazy var homeview: HomeView = {
        let view = HomeView()
        return view
    }()
    
    @objc
    private func buttonDidTap() {
        let viewController = UIViewController()
    
        present(viewController, animated: true)
        
    }
    
    //segmentedcontrol에서 인덱스 값 업데이트 되었을때 메서드
    private func setupAction() {
            homeview.segmentedControl.addTarget(
                self,
                action: #selector(segmentedControlValueChanged(segment:)),
                for: .valueChanged
            )
        }

    @objc
        private func segmentedControlValueChanged(segment: UISegmentedControl) {
            if segment.selectedSegmentIndex == 0 {
                homeview.adImage.isHidden = false
            }
            else {
                homeview.adImage.isHidden = true
            }
        }
    
    private func setUpDelegate() {
        homeview.homeCollectionView.dataSource = self
    }
}

