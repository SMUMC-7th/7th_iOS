import UIKit
import SnapKit

class HomeViewController: UIViewController, UICollectionViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = homeview
        setupAction()
        setUpDelegate()
    
        homeview.homeCollectionView.tag = 1
        homeview.justDroppedCollectionView.tag = 2
        homeview.challengeCollectionView.tag = 3
        
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //collectionview에 몇개의 데이터가 들어갈지 반환해주는거 model dummy에 있는ㄱ ㅐ갯수만큼
        if collectionView.tag == 1 {
            return HomeModel.dummy().count
        }
        if collectionView.tag == 2 {
            return JustDroppedModel.dummy().count
        }
        if collectionView.tag == 3 {
            return ChallengeModel.dummy().count
        }
        return 0 //기본값
    }
    //어떤 내용이 구현될지 표시하는 cellForItemAt
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //cell이 nil이면 UICollectionViewCell 반환, 재사용 큐
        if collectionView.tag == 1 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier, for: indexPath) as? HomeCollectionViewCell else {
                return UICollectionViewCell()
            }
            //dummy 데이터 바인딩
            let list = HomeModel.dummy()
            cell.imageView.image = list[indexPath.row].image
            cell.titleLabel.text = list[indexPath.row].name
            return cell
        }
        else if collectionView.tag == 2 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: JustDroppedCollectionViewCell.identifier, for: indexPath) as? JustDroppedCollectionViewCell else {
                return UICollectionViewCell()
            }
            //dummy 데이터 바인딩
            let list = JustDroppedModel.dummy()
            cell.imageView.image = list[indexPath.row].image
            cell.brandLabel.text = list[indexPath.row].brand
            cell.nameLabel.text = list[indexPath.row].name
            cell.priceLabel.text = list[indexPath.row].price
            cell.pricedescriptionLabel.text = list[indexPath.row].pricedescription
            return cell
        }
        else if collectionView.tag == 3 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChallengeCollectionViewCell.identifier, for: indexPath) as? ChallengeCollectionViewCell else {
                return UICollectionViewCell()
            }
            //dummy 데이터 바인딩
            let list = ChallengeModel.dummy()
            cell.imageView.image = list[indexPath.row].image
            cell.idLabel.text = list[indexPath.row].id
            return cell
        }
        return UICollectionViewCell() //기본값
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
                homeview.recommendView.isHidden = false
            }
            else {
                homeview.recommendView.isHidden = true
            }
        }
    
    private func setUpDelegate() {
        homeview.homeCollectionView.dataSource = self
        homeview.challengeCollectionView.dataSource = self
        homeview.justDroppedCollectionView.dataSource = self
    }
}

