//
//  RulesViewController.swift
//  SweetFruits
//
//  Created by Gulzat on 15/7/23.
//

import UIKit

class RulesViewController: BaseViewController {

    private let closeBtn: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "ic_close"), for: .normal)
        return button
    }()
    
    private let ruleView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 159/255, green: 81/255, blue: 254/255, alpha: 1)
        view.layer.borderWidth = 3
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.cornerRadius = 33
        return view
    }()
    
    private let ruleTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "RULES"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 32, weight: .heavy)
        return label
    }()
    
    private let ruleTextView: UITextView = {
       let view = UITextView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "The goal of the game is to get out of the pyramid. To do this, select the cells and navigate through them. But do it carefully, because in some of them you will expect traps or bonuses.\n\nThere are some signs you should know:"
        view.textAlignment = .left
        view.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        view.textColor = .white
        view.sizeToFit()
        view.isScrollEnabled = false
        view.backgroundColor = UIColor(red: 159/255, green: 81/255, blue: 254/255, alpha: 1)
        return view
    }()
    
    private let ruleHStackView1: UIStackView = {
       let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.spacing = 20
        return stack
    }()
    
    private let ruleHStackView2: UIStackView = {
       let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.spacing = 20
        return stack
    }()
    
    private let ruleHStackView3: UIStackView = {
       let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.spacing = 20
        return stack
    }()
    
    private let ruleHStackView4: UIStackView = {
       let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.spacing = 20
        return stack
    }()
    
    private let rule1Image = UIImageView(image: UIImage(named: "ic_rule1"))
    private let rule2Image = UIImageView(image: UIImage(named: "ic_rule2"))
    private let rule3Image = UIImageView(image: UIImage(named: "ic_rule3"))
    private let rule4Image = UIImageView(image: UIImage(named: "ic_rule4"))
    
    private let rule1Text: UILabel = {
        let label = UILabel()
        label.text = "A trick question if you answer incorrectly, you will die"
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 12, weight: .heavy)
        label.numberOfLines = 0
        return label
    }()
    
    private let rule2Text: UILabel = {
        let label = UILabel()
        label.text = "Your bonus is here! Just spin to receive"
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 12, weight: .heavy)
        label.numberOfLines = 0
        return label
    }()
    
    private let rule3Text: UILabel = {
        let label = UILabel()
        label.text = "Oops you’re dead"
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 12, weight: .heavy)
        label.numberOfLines = 0
        return label
    }()
    
    private let rule4Text: UILabel = {
        let label = UILabel()
        label.text = "Congratulations! You’ve found a way out!"
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 12, weight: .heavy)
        label.numberOfLines = 0
        return label
    }()
    
    private let ruleVStackView: UIStackView = {
       let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .leading
        stack.spacing = 12
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("heigth: \(heigth)")
        initUI()
        initAction()
    }
    
    private func initUI() {
        view.addSubview(ruleView)
        view.addSubview(closeBtn)
        ruleView.addSubview(ruleTitleLabel)
        ruleView.addSubview(ruleTextView)
        ruleView.addSubview(ruleVStackView)
        
        ruleView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.centerY.equalToSuperview()
        }
        
        closeBtn.snp.makeConstraints { make in
            make.top.equalTo(ruleView.snp.top).offset(-16)
            make.trailing.equalTo(ruleView.snp.trailing).offset(8)
            make.height.width.equalTo(40.0)
        }
        
        ruleTitleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(16.0)
        }
       
        ruleTextView.snp.makeConstraints { make in
            make.top.equalTo(ruleTitleLabel.snp.bottom).offset(20.0)
            make.leading.trailing.equalToSuperview().inset(16.0)
        }
        
        ruleVStackView.snp.makeConstraints { make in
            make.top.equalTo(ruleTextView.snp.bottom).offset(16.0)
            make.leading.trailing.equalToSuperview().inset(16.0)
            make.bottom.equalToSuperview().offset(-20)
        }
        
        ruleVStackView.addArrangedSubview(ruleHStackView1)
        ruleVStackView.addArrangedSubview(ruleHStackView2)
        ruleVStackView.addArrangedSubview(ruleHStackView3)
        ruleVStackView.addArrangedSubview(ruleHStackView4)
        
        ruleHStackView1.addArrangedSubview(rule1Image)
        ruleHStackView1.addArrangedSubview(rule1Text)
        
        ruleHStackView2.addArrangedSubview(rule2Image)
        ruleHStackView2.addArrangedSubview(rule2Text)
        
        ruleHStackView3.addArrangedSubview(rule3Image)
        ruleHStackView3.addArrangedSubview(rule3Text)
        
        ruleHStackView4.addArrangedSubview(rule4Image)
        ruleHStackView4.addArrangedSubview(rule4Text)
    }
    
    private func initAction() {
        closeBtn.addTarget(self, action: #selector(popToRoot), for: .touchUpInside)
    }
    
    @objc func closeView(_ sender: UIButton) {
        
    }
}
