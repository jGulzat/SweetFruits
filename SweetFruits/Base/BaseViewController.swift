//
//  BaseViewController.swift
//  SweetFruits
//
//  Created by Gulzat on 18/7/23.
//

import UIKit

class BaseViewController: UIViewController {
    let heigth = UIScreen.main.bounds.height
    
    private let bgImageView: UIImageView = {
        let bgImage = UIImageView(image: UIImage(named: "ic_background"))
        bgImage.contentMode = .scaleAspectFill
        return bgImage
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        setBackground()
    }
    
    func setBackground() {
        
        view.addSubview(bgImageView)
        
        bgImageView.snp.makeConstraints { make in
            make.top.trailing.bottom.trailing.equalToSuperview()
            make.height.width.equalTo(view)
        }
    }
    
    @objc func popToRoot(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
}
