//
//  LevelsViewController.swift
//  SweetFruits
//
//  Created by Gulzat on 15/7/23.
//

import UIKit

class LevelsViewController: BaseViewController {

    private let backIV: UIImageView = UIImageView(image: UIImage(named: "ic_back"))
    
    private let titleView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 24
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
    
    private let collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 88, height: 88)
        layout.scrollDirection = .vertical
    
        layout.minimumLineSpacing = 32
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(LevelCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        cv.backgroundColor = .clear
        cv.showsVerticalScrollIndicator = false
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        collectionView.delegate = self
        
        initUI()
        initAction()
    }
    
    private func initUI() {
        backIV.isUserInteractionEnabled = true
        let barHeigth = navigationController?.navigationBar.bounds.height ?? 40
        view.addSubview(backIV)
        view.addSubview(titleView)
        titleView.addSubview(titleLabel)
        view.addSubview(collectionView)
        
        backIV.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20.0)
            make.top.equalToSuperview().offset(barHeigth * 2)
            make.height.width.equalTo(40)
        }
        
        titleView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(barHeigth * 2)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(36)
            make.top.bottom.equalToSuperview().inset(10)
        }
        
        collectionView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.top.equalTo(titleView.snp.bottom).offset(barHeigth)
            make.bottom.equalToSuperview().offset(-20)
        }
    }
    
    private func initAction() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(popToRoot))
        backIV.addGestureRecognizer(gesture)
    }

}

extension LevelsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("selected level: \(indexPath.row + 1)")
        let vc = PlayViewController(levelNumber: indexPath.row + 1)
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension LevelsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        levelArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! LevelCollectionViewCell
        cell.setLevelNumber("\(indexPath.row + 1)", status: levelArr[indexPath.row].isOpen)
        return cell
    }

}
