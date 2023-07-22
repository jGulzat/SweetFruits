//
//  OverViewController.swift
//  SweetFruits
//
//  Created by Gulzat on 20/7/23.
//

import UIKit

class OverViewController: BaseViewController {

    private let resultOverView: UIView = {
        let view = UIView()
      //  view.backgroundColor = UIColor(red: 233/255, green: 0/255, blue: 56/255, alpha: 1)
        view.layer.borderWidth = 3
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.cornerRadius = 33
        return view
    }()
    
    private let titleImage = UIImageView(image: UIImage(named: "ic_game_over"))
    
    private let resultLabel: UILabel = {
        let label = UILabel()
        label.text = "Oops you’re dead! please try again"
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let bottomView = UIView()
    
    private let goHomeBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "ic_go_home"), for: .normal)
        return btn
    }()
    
    private let rePlayBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "ic_replay"), for: .normal)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initUI()
        initAction()
    }
    
    private func initUI() {
        view.addSubview(resultOverView)
        resultOverView.addSubview(titleImage)
        resultOverView.addSubview(resultLabel)
        resultOverView.addSubview(bottomView)
        bottomView.addSubview(goHomeBtn)
        bottomView.addSubview(rePlayBtn)
        
        resultOverView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.centerY.equalToSuperview()
        }
        
        titleImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(40)
            make.centerX.equalToSuperview()
        }
        
        resultLabel.snp.makeConstraints { make in
            make.top.equalTo(titleImage.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        bottomView.snp.makeConstraints { make in
            make.top.equalTo(resultLabel.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-20)
        }
        
        goHomeBtn.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview()
            make.height.width.equalTo(80)
        }
        
        rePlayBtn.snp.makeConstraints { make in
            make.leading.equalTo(goHomeBtn.snp.trailing).offset(40)
            make.trailing.top.bottom.equalToSuperview()
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let gradient = CAGradientLayer()
        gradient.frame = resultOverView.bounds
        gradient.colors = [Color.gradientStart, UIColor.white]
        resultOverView.layer.insertSublayer(gradient, at: 0)
    }
    
    private func initAction() {
        goHomeBtn.addTarget(self, action: #selector(popToRoot), for: .touchUpInside)
        rePlayBtn.addTarget(self, action: #selector(replay), for: .touchUpInside)
    }
    
    @objc func replay(_ sender: UITapGestureRecognizer) {
        let vc = PlayViewController(levelNumber: 1)
        navigationController?.pushViewController(vc, animated: true)
    }
}
