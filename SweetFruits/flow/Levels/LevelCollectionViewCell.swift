//
//  LevelCollectionViewCell.swift
//  SweetFruits
//
//  Created by Gulzat on 19/7/23.
//

import UIKit

class LevelCollectionViewCell: UICollectionViewCell {
    
    private let levelView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 16
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 3
        view.backgroundColor = .green
        return view
    }()
    
    private let levelLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 48, weight: .heavy)
        label.textColor = .white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        contentView.layer.cornerRadius = 16
        contentView.layer.borderColor = UIColor.white.cgColor
        contentView.layer.borderWidth = 3
        contentView.backgroundColor = .green
        
        addSubview(levelLabel)
        
        levelLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    func setLevelNumber(_ level: String, status: Bool) {
        print("status: \(status)")
        
        if status {
            levelLabel.text = level
            contentView.backgroundColor = .green
        } else {
            levelLabel.text = ""
            contentView.backgroundColor = UIColor(patternImage: UIImage(named: "ic_blocked") ?? UIImage())
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
