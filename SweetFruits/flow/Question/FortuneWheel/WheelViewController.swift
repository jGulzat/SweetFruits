//
//  WheelViewController.swift
//  SweetFruits
//
//  Created by Gulzat on 22/7/23.
//

import UIKit

class WheelViewController: BaseViewController {
    
    private let level: Int
    
    private let wheelImageView: UIImageView = {
        let bgImage = UIImageView(image: UIImage(named: "ic_wheel"))
        bgImage.contentMode = .scaleAspectFill
        return bgImage
    }()

    private let spinBtn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .green
        btn.layer.cornerRadius = 24
        btn.layer.borderColor = UIColor.white.cgColor
        btn.layer.borderWidth = 3
        btn.setTitle("SPIN", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 32, weight: .heavy)
        return btn
    }()
    
    private let resultImageView: UIImageView = {
        let bgImage = UIImageView(image: UIImage(named: "ic_wheel_result"))
        bgImage.contentMode = .scaleToFill
        return bgImage
    }()
    
    private let bonusImageView: UIImageView = {
        let bgImage = UIImageView(image: UIImage(named: "ic_bonus"))
        bgImage.contentMode = .scaleAspectFill
        return bgImage
    }()
    
    init(level: Int) {
        self.level = level
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
        initAction()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        spinBtn.isEnabled = true
    }
    
    private func initUI() {
        let barHeigth = navigationItem.titleView?.bounds.height ?? 40
        
        view.addSubview(wheelImageView)
        view.addSubview(spinBtn)
        view.addSubview(bonusImageView)
        
        wheelImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
        
        bonusImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(barHeigth * 2)
        }
        
        spinBtn.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(40)
            make.bottom.equalToSuperview().offset(-40)
            make.height.equalTo(68)
        }
    }
    
    private func initAction() {
        spinBtn.addTarget(self, action: #selector(spinWheel), for: .touchUpInside)
    }
    
    @objc func spinWheel(_ sender: UIButton) {
        spinBtn.isEnabled = false
        
        let randomIndex = Int.random(in: 0..<2)
        let question = levelArr[self.level].questions[randomIndex]
        let vc = QuestionViewController(info: QuestionInfo.elements[randomIndex],
                                        level: self.level)
        
        UIView.animate(withDuration: 0.5, animations: {
            self.wheelImageView.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
        })
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            UIView.animate(withDuration: 0.5, animations: {
                self.wheelImageView.transform = CGAffineTransform(rotationAngle: CGFloat(180 * Double.pi))
                self.wheelImageView.image = UIImage(named: "ic_wheel_result")
            })
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension UIImage {
    func rotate(radians: CGFloat) -> UIImage {
        let rotatedSize = CGRect(origin: .zero, size: size)
            .applying(CGAffineTransform(rotationAngle: CGFloat(radians)))
            .integral.size
        UIGraphicsBeginImageContext(rotatedSize)
        if let context = UIGraphicsGetCurrentContext() {
            let origin = CGPoint(x: rotatedSize.width / 2.0,
                                 y: rotatedSize.height / 2.0)
            context.translateBy(x: origin.x, y: origin.y)
            context.rotate(by: radians)
            draw(in: CGRect(x: -origin.y, y: -origin.x,
                            width: size.width, height: size.height))
            let rotatedImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()

            return rotatedImage ?? self
        }

        return self
    }
}
