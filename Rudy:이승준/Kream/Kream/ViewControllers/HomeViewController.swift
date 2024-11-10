import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    let homeView = HomeView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = homeView
        setupCollectionViews()
        setupAction()
    }
    
    private func setupCollectionViews() {
        setupCollectionView(homeView.categoryCollectionView, type: .category)
        setupCollectionView(homeView.justDroppedCollectionView, type: .justDropped)
        setupCollectionView(homeView.challengeCollectionView, type: .challenge)
    }
    
    private func setupCollectionView(_ collectionView: UICollectionView, type: CollectionViewType) {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.tag = type.rawValue
        
        switch type {
        case .category:
            collectionView.register(HomeCategoryCollectionViewCell.self, forCellWithReuseIdentifier: HomeCategoryCollectionViewCell.identifier)
        case .justDropped:
            collectionView.register(JustDroppedCollectionViewCell.self, forCellWithReuseIdentifier: JustDroppedCollectionViewCell.identifier)
        case .challenge:
            collectionView.register(ChallengeCollectionViewCell.self, forCellWithReuseIdentifier: ChallengeCollectionViewCell.identifier)
        }
    }
    
    private func setupAction() {
        homeView.segmentedControl.addTarget( self, action: #selector(segmentedControlValueChanged), for: .valueChanged)
    }
    
    @objc private func segmentedControlValueChanged() {
        let selectedSegmentIndex = homeView.segmentedControl.selectedSegmentIndex
        let selectedSegmentFrame = homeView.segmentedControl.subviews[selectedSegmentIndex].frame
        let segmentTitle = homeView.segmentedControl.titleForSegment(at: selectedSegmentIndex) ?? ""
        
        let textAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 16, weight: .bold)
        ]
        
        let textWidth = (segmentTitle as NSString).size(withAttributes: textAttributes).width
        let segmentWidth = selectedSegmentFrame.width
        let textStartX = (segmentWidth - textWidth) / 2
        let leadingDistance = selectedSegmentFrame.origin.x + textStartX
        
        self.homeView.setUnderline(leadingDistance: leadingDistance, textWidth: textWidth + 1)
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let type = CollectionViewType(rawValue: collectionView.tag) else { return 0 }
        
        switch type {
        case .category:
            return HomeCategoryModel.data.count
        case .justDropped:
            return SavedProducts.just.count
        case .challenge:
            return ChallengeModel.data.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let type = CollectionViewType(rawValue: collectionView.tag) else { return UICollectionViewCell() }
        
        switch type {
        case .category:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCategoryCollectionViewCell.identifier, for: indexPath) as! HomeCategoryCollectionViewCell
            let data = HomeCategoryModel.data[indexPath.row]
            cell.configuration(data: data)
            return cell
        case .justDropped:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: JustDroppedCollectionViewCell.identifier, for: indexPath) as! JustDroppedCollectionViewCell
            let data = SavedProducts.just[indexPath.row]
            cell.configuration(data: data)
            return cell
        case .challenge:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChallengeCollectionViewCell.identifier, for: indexPath) as! ChallengeCollectionViewCell
            let data = ChallengeModel.data[indexPath.row]
            cell.configuration(data: data)
            return cell
        }
    }
}

enum CollectionViewType: Int {
    case category = 0
    case justDropped = 1
    case challenge = 2
}
