//
//  ShopViewController.swift
//  SweetFruits
//
//  Created by Gulzat on 15/7/23.
//

import UIKit

class ShopViewController: BaseViewController {

    private let closeBtn: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "ic_close"), for: .normal)
        return button
    }()
    
    private let shopView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 159/255, green: 81/255, blue: 254/255, alpha: 1)
        view.layer.borderWidth = 3
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.cornerRadius = 33
        return view
    }()
    
    private let shopTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "SHOP"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 32, weight: .heavy)
        return label
    }()
    
    private let coinView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4)
        view.layer.cornerRadius = 16
        return view
    }()
    
    private let coinLabel: UILabel = {
         let label = UILabel()
         label.text = "125"
         label.textColor = .white
         label.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
         return label
    }()
    
    private let coinIcon = UIImageView(image: UIImage(named: "ic_coin"))
    
    private let showHStackView: UIStackView = {
         let stack = UIStackView()
         stack.axis = .horizontal
        stack.alignment = .fill
         stack.spacing = 16
         return stack
    }()
    
    private let showVStackView1: UIStackView = {
         let stack = UIStackView()
         stack.axis = .vertical
         stack.alignment = .center
         stack.spacing = 16
         return stack
    }()
    
    private let showVStackView2: UIStackView = {
         let stack = UIStackView()
         stack.axis = .vertical
         stack.alignment = .center
         stack.spacing = 16
         return stack
    }()
    
    private let showVStackView3: UIStackView = {
         let stack = UIStackView()
         stack.axis = .vertical
         stack.alignment = .center
         stack.spacing = 16
         return stack
    }()
    
    private let goodsView1: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        view.sizeToFit()
        return view
    }()
    
    private let goodsView2: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        view.sizeToFit()
        return view
    }()
    
    private let goodsView3: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        view.sizeToFit()
        return view
    }()
    
    private let goodsImage1 = UIImageView(image: UIImage(named: "ic_goods1"))
    private let goodsImage2 = UIImageView(image: UIImage(named: "ic_goods2"))
    private let goodsImage3 = UIImageView(image: UIImage(named: "ic_goods3"))
    
    private let price1HStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 8
        stack.alignment = .center
        return stack
    }()
    
    private let price1Label: UILabel = {
       let label = UILabel()
        label.text = "100"
        label.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
        return label
    }()
    
    private let price1Coin = UIImageView(image: UIImage(named: "ic_coin"))
    
    private let price2HStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 8
        stack.alignment = .center
        return stack
    }()
    
    private let price2Label: UILabel = {
       let label = UILabel()
        label.text = "150"
        label.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
        return label
    }()
    private let price2Coin = UIImageView(image: UIImage(named: "ic_coin"))
    
    private let price3HStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 8
        stack.alignment = .center
        return stack
    }()
    
    private let price3Label: UILabel = {
       let label = UILabel()
        label.text = "200"
        label.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
        return label
    }()
    
    private let price3Coin = UIImageView(image: UIImage(named: "ic_coin"))
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initUI()
        initAction()
    }
    
    private func initAction() {
        closeBtn.addTarget(self, action: #selector(popToRoot), for: .touchUpInside)
    }
    
    private func initUI() {
        
        view.addSubview(shopView)
        view.addSubview(closeBtn)
        shopView.addSubview(shopTitleLabel)
        shopView.addSubview(showHStackView)
  
        shopView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.centerY.equalToSuperview()
        }
        
        closeBtn.snp.makeConstraints { make in
            make.top.equalTo(shopView.snp.top).offset(-16)
            make.trailing.equalTo(shopView.snp.trailing).offset(8)
            make.height.width.equalTo(40.0)
        }
        
        shopTitleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(32)
        }
        
        showHStackView.snp.makeConstraints { make in
            make.top.equalTo(shopTitleLabel.snp.bottom).offset(16.0)
            make.leading.trailing.equalToSuperview().inset(16.0)
            make.bottom.equalToSuperview().offset(-20)
        }
        
        setCoinConstraints()
        setGoods1Constaints()
        setGoods2Constaints()
        setGoods3Constaints()
        
    }
    
    private func setCoinConstraints() {
        shopView.addSubview(coinView)
        coinView.addSubview(coinLabel)
        coinView.addSubview(coinIcon)
        
        coinView.snp.makeConstraints { make in
            make.leading.equalTo(shopTitleLabel.snp.trailing).offset(20)
            make.top.bottom.equalTo(shopTitleLabel).inset(2)
        }
        
        coinLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(12)
            make.top.bottom.equalToSuperview().inset(4)
            make.trailing.equalToSuperview().offset(-32)
        }
        
        coinIcon.snp.makeConstraints { make in
            make.leading.equalTo(coinView.snp.trailing).offset(-20)
            make.centerY.equalToSuperview()
            make.height.width.equalTo(36)
        }
        
    }
    
    private func setGoods1Constaints() {
        showHStackView.addArrangedSubview(showVStackView1)
        showVStackView1.addArrangedSubview(goodsView1)
        
        goodsView1.addSubview(goodsImage1)
        
        goodsImage1.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(8.0)
            make.leading.trailing.equalToSuperview().inset(16.0)
            make.height.width.equalTo(64.0)
        }
        
        showVStackView1.addArrangedSubview(price1HStackView)
        price1HStackView.addArrangedSubview(price1Label)
        price1HStackView.addArrangedSubview(price1Coin)
        
    }
    
    private func setGoods2Constaints() {
        showHStackView.addArrangedSubview(showVStackView2)
        showVStackView2.addArrangedSubview(goodsView2)
        
        goodsView2.addSubview(goodsImage2)
        
        goodsImage2.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(8.0)
            make.leading.trailing.equalToSuperview().inset(16.0)
            make.height.width.equalTo(64.0)
        }
        
        showVStackView2.addArrangedSubview(price2HStackView)
        price2HStackView.addArrangedSubview(price2Label)
        price2HStackView.addArrangedSubview(price2Coin)
    }
    
    private func setGoods3Constaints() {
        showHStackView.addArrangedSubview(showVStackView3)
        showVStackView3.addArrangedSubview(goodsView3)
        
        goodsView3.addSubview(goodsImage3)
        
        goodsImage3.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(8.0)
            make.leading.trailing.equalToSuperview().inset(16.0)
            make.height.width.equalTo(64.0)
        }
        
        showVStackView3.addArrangedSubview(price3HStackView)
        price3HStackView.addArrangedSubview(price3Label)
        price3HStackView.addArrangedSubview(price3Coin)
    }
}
