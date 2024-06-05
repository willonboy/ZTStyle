//
//  ViewController.swift
//  ZTStyle
//
//  Created by trojan on 2024/6/4.
//

import UIKit
import ZTChain

extension UIView {
    @discardableResult
    public func addTo(_ superview:UIView) -> Self {
        superview.addSubview(self)
        return self
    }
    
    @discardableResult
    public func cornerRadius(_ radius:CGFloat) -> Self {
        _ = self.layer.zt.cornerRadius(radius).masksToBounds(true)
        return self
    }
}

extension ZTStyle where Subject: UILabel {
    static var title: ZTStyle {
        return .custom { label in
            _ = label.zt.font(.boldSystemFont(ofSize: 24)).textColor(.black)
        }
    }

    static var subtitle: ZTStyle {
        return .custom { label in
            _ = label.zt.font(.systemFont(ofSize: 18)).textColor(.darkGray)
        }
    }

    static var body: ZTStyle {
        return .custom { label in
            _ = label.zt.font(.systemFont(ofSize: 14)).textColor(.gray)
        }
    }
}

extension ZTStyle where Subject: UIButton {
    static var primary: ZTStyle {
        return .custom { button in
            button.zt.backgroundColor(.systemBlue)
                .subject.setTitleColor(.white, for: .normal)
        }
    }

    static var secondary: ZTStyle {
        return .custom { button in
            button.zt.backgroundColor(.lightGray)
                .subject.setTitleColor(.black, for: .normal)
        }
    }
}





// 自定义视图类
class StyledContainerView: UIView {
    
    let titleLabel: UILabel
    let subtitleLabel: UILabel
    let bodyLabel: UILabel
    let primaryButton: UIButton
    let secondaryButton: UIButton
    
    override init(frame: CGRect) {
        titleLabel = UILabel()
        subtitleLabel = UILabel()
        bodyLabel = UILabel()
        primaryButton = UIButton()
        secondaryButton = UIButton()
        
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(bodyLabel)
        addSubview(primaryButton)
        addSubview(secondaryButton)
        
        // 使用 frame 进行布局
        let padding: CGFloat = 10.0
        let buttonHeight: CGFloat = 44.0
        
        titleLabel.frame = CGRect(x: padding, y: padding, width: self.frame.width - 2 * padding, height: 30)
        subtitleLabel.frame = CGRect(x: padding, y: titleLabel.frame.maxY + padding, width: self.frame.width - 2 * padding, height: 25)
        bodyLabel.frame = CGRect(x: padding, y: subtitleLabel.frame.maxY + padding, width: self.frame.width - 2 * padding, height: 20)
        primaryButton.frame = CGRect(x: padding, y: bodyLabel.frame.maxY + padding, width: self.frame.width - 2 * padding, height: buttonHeight)
        secondaryButton.frame = CGRect(x: padding, y: primaryButton.frame.maxY + padding, width: self.frame.width - 2 * padding, height: buttonHeight)
    }
}

// 样式定义扩展
extension ZTStyle where Subject: StyledContainerView {
    static var style1: ZTStyle {
        return .custom { container in
            _ = container.titleLabel.zt.style(.title).textColor(.darkGray).text("container.style1.titleLabel")
            _ = container.subtitleLabel.zt.style(.subtitle).textColor(.black).text("container.style1.subtitleLabel")
            _ = container.bodyLabel.zt.style(.body).backgroundColor(.red).text("container.style1.bodyLabel")
            container.primaryButton.zt.style(.primary).subject.setTitle("container.style1.primaryButton", for: .normal)
            container.secondaryButton.zt.style(.secondary).subject.setTitle("container.style1.secondaryButton", for: .normal)
        }
    }
    
    static var style2: ZTStyle {
        return .custom { container in
            _ = container.titleLabel.zt.style(.title).textColor(.blue).text("container.style2.titleLabel")
            _ = container.subtitleLabel.zt.style(.subtitle).textColor(.green).text("container.style2.subtitleLabel")
            _ = container.bodyLabel.zt.style(.body).backgroundColor(.yellow).text("container.style2.bodyLabel")
            container.primaryButton.zt.style(.primary).backgroundColor(.systemRed).subject.setTitle("container.style2.primaryButton", for: .normal)
            container.secondaryButton.zt.style(.secondary).backgroundColor(.systemOrange).subject.setTitle("container.style2.secondaryButton", for: .normal)
        }
    }
}











class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Usage Example
        UILabel(frame: CGRect(x: 20, y: 50, width: 350, height: 20)).zt
            .style(.title)
            .text("style .title")
            .subject.addTo(view)

        UILabel(frame: CGRect(x: 20, y: 90, width: 350, height: 20)).zt
            .style(.subtitle)
            .text("style .subtitle")
            .subject.addTo(view)

        UILabel(frame: CGRect(x: 20, y: 130, width: 350, height: 20)).zt
            .style(.body)
            .text("style .body")
            .subject.addTo(view)

        let primaryButton = UIButton(frame: CGRect(x: 20, y: 170, width: 350, height: 30)).zt
            .style(.primary)
            .subject
            .cornerRadius(CGFloat(4))
            .addTo(view)
        primaryButton.setTitle("style .primary", for: .normal)

        let secondaryButton = UIButton(frame: CGRect(x: 20, y: 210, width: 350, height: 30)).zt
            .style(.secondary)
            .subject
            .cornerRadius(CGFloat(6))
            .addTo(view)
        secondaryButton.setTitle("style .secondary", for: .normal)
        
        // 使用示例
        StyledContainerView(frame: CGRect(x: 10, y: 260, width: 350, height: 250)).zt.style(.style1).subject.addTo(view)
        
        StyledContainerView(frame: CGRect(x: 10, y: 500, width: 350, height: 250)).zt.style(.style2).subject.addTo(view)
    }
}

