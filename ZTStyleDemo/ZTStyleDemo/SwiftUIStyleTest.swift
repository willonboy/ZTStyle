//
//  SwiftUIStyleTest.swift
//  ZTStyleDemo
//
//  Created by trojan on 2024/9/9.
//

import SwiftUI

/// 🐞 Here is a SwiftUI bug. Guess what color the text will finally display?
//#Preview {
//    Text("Hello world")
//        .foregroundColor(.red).foregroundColor(.green).foregroundColor(.yellow)
//}

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
