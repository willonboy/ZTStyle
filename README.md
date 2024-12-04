# ZTStyle

A lightweight Swift library for customizing and applying styles to UIKit or SwiftUI components, just like using CSS styles.

This is currently the only solution that enables CSS-like styling for all UIKit objects.

一个轻量的Swift库，像使用CSS Style样式那样定制和应用样式到UIKit或SwiftUI控件上。

## Features 特性

- Chainable syntax for applying styles to UI components.
- Support for custom styles.
- Extensible to various UIKit components and SwiftUI Views.

- 使用链式语法应用样式到 UI 组件。
- 支持自定义样式。
- 可扩展到各种 UIKit & SwiftUI 组件。

## Installation 安装

### Swift Package Manager (SPM)

To integrate `ZTStyle` into your Xcode project using SPM:

1. Open your project in Xcode.
2. Go to `File` > `Add Packages`.
3. Enter the repository URL: `https://github.com/willonboy/ZTStyle`.
4. Choose the version and click `Add Package`.

### CocoaPods

To integrate `ZTStyle` into your Xcode project using CocoaPods:

1. Add the following line to your `Podfile`:

```ruby
pod 'ZTStyle', :git => 'https://github.com/willonboy/ZTStyle.git'
```

2. Run `pod install`.

### Swift 包管理器 (SPM)

使用 SPM 将 `ZTStyle` 集成到您的 Xcode 项目中：

1. 在 Xcode 中打开您的项目。
2. 转到 `文件` > `添加包`。
3. 输入仓库 URL：`https://github.com/willonboy/ZTStyle`。
4. 选择版本并点击 `添加包`。

### CocoaPods

使用 CocoaPods 将 `ZTStyle` 集成到您的 Xcode 项目中：

1. 在您的 `Podfile` 中添加以下行：

```ruby
pod 'ZTStyle', :git => 'https://github.com/willonboy/ZTStyle.git'
```

2. 运行 `pod install`。

## Usage 使用

### Basic Example 基本示例

```swift
import UIKit
import ZTChain
import ZTStyle

// Define a custom style
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

// Apply style to a UILabel
let titleLabel = UILabel().zt
    .style(.title)
    .subject
    
// Apply multi style to UILabel
let titleLabel = UILabel().zt
    .style( .title, 
            .subtitle, 
            .body,
            .custom({ $0.backgroundColor = .systemPurple }) // concise and convenient approach.
          )
    .build() // call subject or build()
```


### Custom View Example 自定义视图示例

```swift
import UIKit
import ZTChain
import ZTStyle


// Custom view class
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
        
        let padding: CGFloat = 10.0
        let buttonHeight: CGFloat = 44.0
        
        titleLabel.frame = CGRect(x: padding, y: padding, width: self.frame.width - 2 * padding, height: 30)
        subtitleLabel.frame = CGRect(x: padding, y: titleLabel.frame.maxY + padding, width: self.frame.width - 2 * padding, height: 25)
        bodyLabel.frame = CGRect(x: padding, y: subtitleLabel.frame.maxY + padding, width: self.frame.width - 2 * padding, height: 20)
        primaryButton.frame = CGRect(x: padding, y: bodyLabel.frame.maxY + padding, width: self.frame.width - 2 * padding, height: buttonHeight)
        secondaryButton.frame = CGRect(x: padding, y: primaryButton.frame.maxY + padding, width: self.frame.width - 2 * padding, height: buttonHeight)
    }
}

// Define styles for the custom view
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


// Usage example
StyledContainerView(frame: CGRect(x: 10, y: 260, width: 350, height: 250)).zt.style(.style1).subject.addTo(view)
    
StyledContainerView(frame: CGRect(x: 10, y: 500, width: 350, height: 250)).zt.style(.style2).build().addTo(view)

```

### SwiftUI demo
```swift
extension Text {
    static let style1:ZTSwiftUIStyle<Text> = .custom { text in
        text.bold().foregroundColor(.green)
    }
    static let style2:ZTSwiftUIStyle<Text> = .custom { text in
        text.italic().foregroundColor(.red)
    }
    static let style3:ZTSwiftUIStyle<Text> = .custom { text in
        text.underline(true)
    }
}

#Preview {
    Text("Hello world")
        .style( Text.style1
                ,Text.style2
                ,Text.style3
                ,.custom { $0.foregroundColor(.yellow) }
                ,.custom({ $0.font(.title)})
        )
}
```

## License 许可证

This project is licensed under the AGPLv3.
