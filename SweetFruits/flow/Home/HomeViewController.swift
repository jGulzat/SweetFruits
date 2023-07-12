//
//  HomeViewController.swift
//  SweetFruits
//
//  Created by Gulzat on 12/7/23.
//

import UIKit

class HomeViewController: UIViewController {

    private let bgImageView: UIImageView = {
        let bgImage = UIImageView(image: UIImage(named: "ic_main"))
        bgImage.contentMode = .scaleAspectFill
        return bgImage
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initUI()
    }
    
    private func initUI() {
        view.addSubview(bgImageView)
        
        bgImageView.snp.makeConstraints { make in
            make.top.trailing.bottom.trailing.equalToSuperview()
            make.height.width.equalTo(view)
        }
    }
}
