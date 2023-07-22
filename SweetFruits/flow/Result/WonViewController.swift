//
//  WonViewController.swift
//  SweetFruits
//
//  Created by Gulzat on 20/7/23.
//

import UIKit

class WonViewController: BaseViewController {

    private let coin: Int
    private let level: Int
    
    private let resultWonView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 159/255, green: 81/255, blue: 254/255, alpha: 1)
        view.layer.borderWidth = 3
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.cornerRadius = 33
        return view
    }()
    
    private let titleImage = UIImageView(image: UIImage(named: "ic_won"))
    
    private let levelView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        return view
    }()
    
    private let levelLabel: UILabel = {
       let label = UILabel()
        label.text = "LEVEL 10"
        label.font = UIFont.systemFont(ofSize: 12, weight: .heavy)
        label.textColor = UIColor(red: 159/255, green: 81/255, blue: 254/255, alpha: 1)
        label.textAlignment = .center
        return label
    }()
    
    private let resultLabel: UILabel = {
        let label = UILabel()
        label.text = "Congratulations, You’ve opened a new level!"
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let coinView = UIView()
    
    private let coinLabel: UILabel = {
       let label = UILabel()
        label.text = "+100"
        label.font = UIFont.systemFont(ofSize: 64, weight: .heavy)
        label.textColor = .white
        return label
    }()
    
    private let coinImage = UIImageView(image: UIImage(named: "ic_coin"))
    
    private let goHomeBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "ic_go_home"), for: .normal)
        return btn
    }()
    
    private let nextView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        view.layer.borderWidth = 3
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.cornerRadius = 25
        return view
    }()
    
    private let nextLabel: UILabel = {
       let label = UILabel()
        label.text = "NEXT LEVEL"
        label.font = UIFont.systemFont(ofSize: 24, weight: .heavy)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    init(coin: Int, level: Int) {
        self.coin = coin
        self.level = level
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initUI()
        initData()
        initAction()
    }
    
    private func initData() {
        levelLabel.text = "LEVEL \(level)"
        coinLabel.text = "+\(coin)"
    }
    
    private func initUI() {
        view.addSubview(resultWonView)
        resultWonView.addSubview(titleImage)
        resultWonView.addSubview(levelView)
        levelView.addSubview(levelLabel)
        resultWonView.addSubview(resultLabel)
        resultWonView.addSubview(coinView)
        coinView.addSubview(coinLabel)
        coinView.addSubview(coinImage)
        resultWonView.addSubview(goHomeBtn)
        resultWonView.addSubview(nextView)
        nextView.addSubview(nextLabel)
        
        resultWonView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.centerY.equalToSuperview()
        }
        
        titleImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(40)
            make.centerX.equalToSuperview()
        }
        
        levelView.snp.makeConstraints { make in
            make.top.equalTo(titleImage.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
        }
        
        levelLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(40)
            make.top.bottom.equalToSuperview().inset(8)
        }
        
        resultLabel.snp.makeConstraints { make in
            make.top.equalTo(levelView.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        coinView.snp.makeConstraints { make in
            make.top.equalTo(resultLabel.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
            make.width.equalTo(210)
        }
        
        coinLabel.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview()
        }
        
        coinImage.snp.makeConstraints { make in
            make.leading.equalTo(coinLabel.snp.trailing).offset(8)
            make.centerY.equalTo(coinLabel)
            make.height.width.equalTo(56)
        }
        
        goHomeBtn.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.equalTo(coinView.snp.bottom).offset(32)
            make.bottom.equalToSuperview().offset(-20)
            make.height.width.equalTo(56)
        }
        
        nextView.snp.makeConstraints { make in
            make.top.bottom.equalTo(goHomeBtn)
            make.leading.equalTo(goHomeBtn.snp.trailing).offset(20)
            make.trailing.equalToSuperview().offset(-16)
        }
        
        nextLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    private func initAction() {
        goHomeBtn.addTarget(self, action: #selector(popToRoot), for: .touchUpInside)
        nextView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(showNextLevel)))
    }
    
    @objc func showNextLevel(_ sender: UITapGestureRecognizer) {
        let vc = LevelsViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
