//
//  ViewController.swift
//  SweetFruits
//
//  Created by Gulzat on 12/7/23.
//

import UIKit
import SnapKit

class SplashViewController: UIViewController {
    
    private let bgImageView: UIImageView = {
        let bgImage = UIImageView(image: UIImage(named: "ic_background"))
        bgImage.contentMode = .scaleAspectFill
        return bgImage
    }()
    
    private let splashLabel: UILabel = {
        var label = UILabel()
        label.text = "LOADING ......"
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            let homeVC = HomeViewController() // HomeViewController() // WheelViewController() // 
            let navigation = UINavigationController(rootViewController: homeVC)
            navigation.modalPresentationStyle = .fullScreen
            navigation.modalTransitionStyle = .flipHorizontal
            self.present(navigation, animated: true)
        }
    }
    
    private func initUI() {
        view.addSubview(bgImageView)
        view.addSubview(splashLabel)
        
        bgImageView.snp.makeConstraints { make in
            make.top.trailing.bottom.trailing.equalToSuperview()
            make.height.width.equalTo(view)
        }
        
        splashLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20.0)
            make.bottom.equalToSuperview().offset(-120.0)
        }
    }
}
