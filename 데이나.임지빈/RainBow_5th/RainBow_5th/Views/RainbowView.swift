import UIKit
import SnapKit

class RainbowView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupColorViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //스크롤뷰 생성
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = true //세로 스크롤바 보여주기
        scrollView.showsHorizontalScrollIndicator = false //가로 스크롤바 보여주기
        return scrollView
    }()
    
    // 스크롤뷰 안전영역 맞추기
    private func setupView() {
        self.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(self.safeAreaLayoutGuide)
        }
    }
    
    // 모델의 색상 배열을 사용하여 색상 뷰 설정
    private func setupColorViews() {
        var previousView: UIView? = nil
        
        for color in RainbowColors.colors {
            let colorView = UIView()
            colorView.backgroundColor = color
            scrollView.addSubview(colorView) //스크롤뷰에 colorView 넣어주기
            
            colorView.snp.makeConstraints { make in
                make.left.right.equalToSuperview() // 좌우로 스크롤 없이 화면 크기에 맞춤
                make.width.equalTo(self.snp.width)
                make.height.equalTo(176) // 색상 하나당 높이 176
                
                
                if let previousView = previousView {
                    make.top.equalTo(previousView.snp.bottom) // 이전 뷰의 하단에 배치
                } else {
                    make.top.equalToSuperview() // 첫 번째 뷰는 스크롤뷰 상단에 맞춤
                }
            }
            
            previousView = colorView
        }
        
        // 마지막 뷰의 하단을 스크롤뷰의 하단에 맞춤으로써 스크롤 가능하게 설정
        if let lastView = previousView {
            lastView.snp.makeConstraints { make in
                make.bottom.equalToSuperview()
            }
        }
    }
}
