//
//  HomeViewController.swift
//  SweetFruits
//
//  Created by Gulzat on 12/7/23.
//

import UIKit

class HomeViewController: UIViewController {

    private let bgImageView: UIImageView = {
        let bgImage = UIImageView(image: UIImage(named: "ic_background"))
        bgImage.contentMode = .scaleAspectFill
        return bgImage
    }()
    
    private let logoImage: UIImageView = {
        let logo = UIImageView(image: UIImage(named: "ic_main_logo"))
        logo.contentMode = .scaleAspectFill
        return logo
    }()
    
    private let settingBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "ic_settings"), for: .normal)
        return btn
    }()
    
    private let hStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 16
        return stack
    }()
    
    private let centerBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "ic_center"), for: .normal)
        return btn
    }()
    
    private let leftBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "ic_left"), for: .normal)
        return btn
    }()
    
    private let rigthBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "ic_rigth"), for: .normal)
        return btn
    }()
    
    private let startBtn: UIButton = {
        let btn = UIButton()
       // btn.setImage(UIImage(named: "ic_start_btn"), for: .normal)
        btn.backgroundColor = .green
        btn.layer.cornerRadius = 24
        btn.layer.borderColor = UIColor.white.cgColor
        btn.layer.borderWidth = 3
        btn.setTitle("START", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 32, weight: .heavy)
        //.boldSystemFont(ofSize: 32)
        return btn
    }()
    
    private let levelsBtn: UIButton = {
        let btn = UIButton()
       // btn.setImage(UIImage(named: "ic_levels_btn"), for: .normal)
        btn.backgroundColor = UIColor(red: 255/255, green: 221/255,
                                      blue: 23/255, alpha: 1)
        btn.layer.cornerRadius = 24
        btn.layer.borderColor = UIColor.white.cgColor
        btn.layer.borderWidth = 3
        btn.setTitle("LEVELS", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 32, weight: .heavy)
        return btn
    }()
    
    private let shopBtn: UIButton = {
        let btn = UIButton()
        //btn.setImage(UIImage(named: "ic_shop_btn"), for: .normal)
        btn.backgroundColor = UIColor(red: 255/255, green: 221/255,
                                      blue: 23/255, alpha: 1)
        btn.layer.cornerRadius = 24
        btn.layer.borderColor = UIColor.white.cgColor
        btn.layer.borderWidth = 3
        btn.setTitle("SHOP", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 32, weight: .heavy)
        return btn
    }()
    
    private let rulesBtn: UIButton = {
        let btn = UIButton()
       // btn.setImage(UIImage(named: "ic_rules_btn"), for: .normal)
        btn.backgroundColor = UIColor(red: 255/255, green: 221/255,
                                      blue: 23/255, alpha: 1)
        btn.layer.cornerRadius = 24
        btn.layer.borderColor = UIColor.white.cgColor
        btn.layer.borderWidth = 3
        btn.setTitle("RULES", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 32, weight: .heavy)
        return btn
    }()
    
    private let VStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20.0
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initUI()
    }
    
    private func initUI() {
        let heigth = UIScreen.main.bounds.height
        print("heigth: \(heigth)")
        view.addSubview(bgImageView)
        view.addSubview(settingBtn)
        view.addSubview(logoImage)
        view.addSubview(hStack)
        view.addSubview(VStack)
        
        bgImageView.snp.makeConstraints { make in
            make.top.trailing.bottom.trailing.equalToSuperview()
            make.height.width.equalTo(view)
        }
        
        settingBtn.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20.0)
            make.top.equalToSuperview().offset(heigth < 670 ? 16 : 60)
            make.height.width.equalTo(40)
        }
        
        logoImage.snp.makeConstraints { make in
            make.top.equalTo(settingBtn.snp.bottom).offset(24.0)
            make.leading.trailing.equalToSuperview().inset(40)
            make.height.equalTo(132)
        }
        
        hStack.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(logoImage.snp.bottom).offset(heigth < 670 ? 8 : 40)
        }

        hStack.addArrangedSubview(leftBtn)
        hStack.addArrangedSubview(centerBtn)
        hStack.addArrangedSubview(rigthBtn)
        
        VStack.snp.makeConstraints { make in
            make.top.equalTo(hStack.snp.bottom).offset(heigth < 670 ? 16 : 40)
            make.leading.trailing.equalToSuperview().inset(40.0)
        }
        startBtn.heightAnchor.constraint(equalToConstant: 68).isActive = true
        levelsBtn.heightAnchor.constraint(equalToConstant: 68).isActive = true
        shopBtn.heightAnchor.constraint(equalToConstant: 68).isActive = true
        rulesBtn.heightAnchor.constraint(equalToConstant: 68).isActive = true
        
        VStack.addArrangedSubview(startBtn)
        VStack.addArrangedSubview(levelsBtn)
        VStack.addArrangedSubview(shopBtn)
        VStack.addArrangedSubview(rulesBtn)
    }
    
    
}
