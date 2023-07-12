//
//  LevelsViewController.swift
//  SweetFruits
//
//  Created by Gulzat on 15/7/23.
//

import UIKit

class LevelsViewController: UIViewController {

    private let bgImageView: UIImageView = {
        let bgImage = UIImageView(image: UIImage(named: "ic_background"))
        bgImage.contentMode = .scaleAspectFill
        return bgImage
    }()
    
    private let backBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "ic_back"), for: .normal)
        return btn
    }()
    
    private let titleView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 33
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 3
        view.backgroundColor = UIColor(red: 159/255, green: 81/255,
                                       blue: 254/255, alpha: 1)
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "LEVELS"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        initUI()
    }
    
    private func initUI() {
        let heigth = UIScreen.main.bounds.height
        print("heigth: \(heigth)")
        view.addSubview(bgImageView)
        view.addSubview(backBtn)
        
        bgImageView.snp.makeConstraints { make in
            make.top.trailing.bottom.trailing.equalToSuperview()
            make.height.width.equalTo(view)
        }
        
        backBtn.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20.0)
            make.top.equalToSuperview().offset(heigth < 670 ? 16 : 60)
            make.height.width.equalTo(40)
        }
    }

}
