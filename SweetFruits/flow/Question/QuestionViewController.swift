//
//  QuestionViewController.swift
//  SweetFruits
//
//  Created by Gulzat on 19/7/23.
//

import UIKit

class QuestionViewController: BaseViewController {

    var info: QuestionInfo = QuestionInfo.elements[0]
    
    private let questionView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 159/255, green: 81/255, blue: 254/255, alpha: 1)
        view.layer.borderWidth = 3
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.cornerRadius = 33
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "QUESTION"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 32, weight: .heavy)
        label.textAlignment = .center
        return label
    }()
    
    private let questionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private let answer1View: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 159/255, green: 81/255, blue: 254/255, alpha: 1)
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.cornerRadius = 24
        view.backgroundColor = Color.mainYellow
        view.tag = 1
        return view
    }()
    
    private let answer1Label: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 32, weight: .heavy)
        label.textAlignment = .center
        return label
    }()
    
    private let answer2View: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 159/255, green: 81/255, blue: 254/255, alpha: 1)
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.cornerRadius = 24
        view.backgroundColor = Color.mainYellow
        view.tag = 2
        return view
    }()
    
    private let answer2Label: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 32, weight: .heavy)
        label.textAlignment = .center
        return label
    }()
    
    private let answer3View: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 159/255, green: 81/255, blue: 254/255, alpha: 1)
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.cornerRadius = 24
        view.backgroundColor = Color.mainYellow
        view.tag = 3
        return view
    }()
    
    private let answer3Label: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 32, weight: .heavy)
        label.textAlignment = .center
        return label
    }()
    
    private let answer4View: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 159/255, green: 81/255, blue: 254/255, alpha: 1)
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.cornerRadius = 24
        view.backgroundColor = Color.mainYellow
        view.tag = 4
        return view
    }()
    
    private let answer4Label: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 32, weight: .heavy)
        label.textAlignment = .center
        return label
    }()
    
    private let hStackView: UIStackView = {
       let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 16
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initUI()
        initData()
        initAction()
    }
    
    private func initUI() {
        let barHeigth = navigationItem.titleView?.bounds.height ?? 40
        
        view.addSubview(questionView)
        questionView.addSubview(titleLabel)
        questionView.addSubview(questionLabel)
        view.addSubview(hStackView)
        
        questionView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.top.equalToSuperview().offset(heigth < 670 ? barHeigth * 2 : barHeigth * 3)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20.0)
            make.leading.trailing.equalToSuperview().inset(24)
        }
        
        questionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20.0)
            make.leading.trailing.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().offset(-24)
        }
        
        hStackView.snp.makeConstraints { make in
            make.top.equalTo(questionView.snp.bottom).offset(heigth < 670 ? barHeigth : barHeigth * 2)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        hStackView.addArrangedSubview(answer1View)
        hStackView.addArrangedSubview(answer2View)
        hStackView.addArrangedSubview(answer3View)
        hStackView.addArrangedSubview(answer4View)
        
        answer1View.addSubview(answer1Label)
        answer2View.addSubview(answer2Label)
        answer3View.addSubview(answer3Label)
        answer4View.addSubview(answer4Label)
        
        answer1Label.snp.makeConstraints { make in
            make.width.equalTo(280)
            make.top.bottom.equalToSuperview().inset(12)
            make.centerX.equalToSuperview()
        }
        
        answer2Label.snp.makeConstraints { make in
            make.width.equalTo(280)
            make.top.bottom.equalToSuperview().inset(12)
            make.centerX.equalToSuperview()
        }
        
        answer3Label.snp.makeConstraints { make in
            make.width.equalTo(280)
            make.top.bottom.equalToSuperview().inset(12)
            make.centerX.equalToSuperview()
        }
        
        answer4Label.snp.makeConstraints { make in
            make.width.equalTo(280)
            make.top.bottom.equalToSuperview().inset(12)
            make.centerX.equalToSuperview()
        }
    }
    
    
    private func initData() {
        
        questionLabel.text = info.question
        answer1Label.text = info.answers[0]
        answer2Label.text = info.answers[1]
        answer3Label.text = info.answers[2]
        answer4Label.text = info.answers[3]
    }
    
    private func initAction() {
        answer1View.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(popToRoot)))
        answer2View.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(checkAnswer)))
        answer3View.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(checkAnswer)))
        answer4View.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(checkAnswer)))
    }
    
    @objc func checkAnswer(_ sender: UITapGestureRecognizer) {
       
        if let view = sender.view {
            print(view.tag)
            if view.tag == info.correctAnswerIndex {
                let vc = WonViewController()
                navigationController?.pushViewController(vc, animated: true)
            } else {
                let vc = OverViewController()
                navigationController?.pushViewController(vc, animated: true)
            }
        }
        
    }
}
