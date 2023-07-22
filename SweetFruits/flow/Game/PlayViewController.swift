//
//  PlayViewController.swift
//  SweetFruits
//
//  Created by Gulzat on 19/7/23.
//

import UIKit

class PlayViewController: BaseViewController {

    var levelNumber: Int
    var killerIndex: Int
    
    private let settingBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "ic_settings"), for: .normal)
        return btn
    }()
    
    private let goHomeBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "ic_go_home"), for: .normal)
        return btn
    }()
    
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
        layout.itemSize = CGSize(width: 74, height: 74)
        layout.scrollDirection = .vertical

        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        cv.backgroundColor = .clear
        cv.showsVerticalScrollIndicator = false
        return cv
    }()
    
    init(levelNumber: Int, killerIndex: Int = 14) {
        self.levelNumber = levelNumber
        self.killerIndex = killerIndex
        super.init(nibName: nil, bundle: nil)
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = "LEVEL \(levelNumber)"
        collectionView.delegate = self
        collectionView.dataSource = self
        
        initUI()
        initAction()
    }
    
    private func initUI() {
        
        let barHeigth = navigationItem.titleView?.bounds.height ?? 40
    
        view.addSubview(titleView)
        titleView.addSubview(titleLabel)
        view.addSubview(settingBtn)
        view.addSubview(collectionView)
        view.addSubview(goHomeBtn)
        
        titleView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(heigth < 670 ? 16 : barHeigth * 2)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(36)
            make.top.bottom.equalToSuperview().inset(10)
        }
        
        settingBtn.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20.0)
            make.centerY.equalTo(titleView)
            make.height.width.equalTo(40)
        }
        
        collectionView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.top.equalTo(titleView.snp.bottom).offset(heigth < 670 ? 12 : barHeigth)
            make.bottom.equalTo(goHomeBtn.snp.top).offset(8)
        }
        
        goHomeBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-20)
            make.height.width.equalTo(80)
        }
    }
    
    private func initAction() {
        goHomeBtn.addTarget(self, action: #selector(popToRoot), for: .touchUpInside)
    }
}

extension PlayViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        if indexPath.row == killerIndex {
            showResultGame(true)
        } else if gameRowInfo[indexPath.row] == .way  {
            print("indexPath.row: \(indexPath.row): \(gameRowInfo[indexPath.row])")
            if indexPath.row % 4 == 0 && indexPath.row > 3 && indexPath.row < gameRowInfo.count - 4 {
                setGameStatus(indexPath.row, 4, 1, -4)
            } else if indexPath.row < 4 {
                
                if indexPath.row == 1 || indexPath.row == 2 {
                    
                    setGameStatus(indexPath.row, 4, 1, -1)
                } else if indexPath.row == 0 {
                    
                    setGameStatus(indexPath.row, 4, 1)
                } else if indexPath.row == 3 {
                    
                    setGameStatus(indexPath.row, 4, -1)
                }
            } else if indexPath.row < 24 && indexPath.row > 19 {
                
                if indexPath.row == 21 || indexPath.row == 22 {
                    
                    setGameStatus(indexPath.row, -4, 1, -1)
                } else if indexPath.row == 20 {
                    
                    setGameStatus(indexPath.row, -4, 1)
                } else if indexPath.row == 23 {
                    
                    setGameStatus(indexPath.row, -4, -1)
                }
            } else if (indexPath.row + 1) % 4 == 0 {
                setGameStatus(indexPath.row, 4, -1, -4)
            } else {
                setGameStatus(indexPath.row, 4, -1, -4, 1)
            }
            collectionView.reloadData()
            showResultGame(false)
        }
    }
    
    func showResultGame(_ isKiller: Bool) {
        if isKiller {
            let vc = OverViewController()
            navigationController?.pushViewController(vc, animated: true)
        } else {
            let vc = WheelViewController(level: levelNumber)
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension PlayViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        gameRowInfo.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
       
        switch gameRowInfo[indexPath.row] {
        case .way:
            cell.contentView.backgroundColor = UIColor(patternImage: UIImage(named: "ic_way") ?? UIImage())
        case .player:
            cell.contentView.backgroundColor = UIColor(patternImage: UIImage(named: "ic_player") ?? UIImage())
        case.simpleRow:
            cell.contentView.backgroundColor = UIColor(patternImage: UIImage(named: "ic_simple_row") ?? UIImage())
        }
        return cell
    }

    func setGameStatus(_ index: Int, _ index1: Int, _ index2: Int, _ index3: Int) {
        gameRowInfo.indices.forEach {
            if $0 == index + index1  || $0 == index + index2 || $0 == index + index3{
                gameRowInfo[$0] = .way
            } else {
                setway(index, i: $0)
            }
        }
    }
    
    func setGameStatus(_ index: Int, _ index1: Int, _ index2: Int) {
        gameRowInfo.indices.forEach {
            if $0 == index + index1  || $0 == index + index2 {
                gameRowInfo[$0] = .way
            } else {
                setway(index, i: $0)
            }
        }
    }
    
    func setGameStatus(_ index: Int, _ index1: Int, _ index2: Int, _ index3: Int, _ index4: Int) {
        gameRowInfo.indices.forEach {
            if $0 == index + index1  || $0 == index + index2
                || $0 == index + index3 || $0 == index + index4 {
                gameRowInfo[$0] = .way
            } else {
                setway(index, i: $0)
            }
        }
    }
    
    func setway(_ index: Int, i: Int) {
      if i == index {
          gameRowInfo[i] = .player
      } else {
          gameRowInfo[i] = .simpleRow
      }
    }
}
