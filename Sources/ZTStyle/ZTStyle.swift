//
// ZTStyle.swift
//
// GitHub Repo and Documentation: https://github.com/willonboy/ZTStyle
//
// Copyright © 2024 Trojan Zhang. All rights reserved.
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Affero General Public License as
// published by the Free Software Foundation, either version 3 of the
// License, or (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU Affero General Public License for more details.
//
// You should have received a copy of the GNU Affero General Public License
// along with this program. If not, see <https://www.gnu.org/licenses/>.
//

import ZTChain
import SwiftUI

public extension ZTWrapper where Subject: UIView {
    @discardableResult
    func style(_ styles: ZTStyle<Subject>...) -> ZTWrapper {
        styles.forEach { style in
            style.apply(to: subject)
        }
        return self
    }
}

// better than struct
public enum ZTStyle<Subject> where Subject: UIView {
    case custom((Subject) -> Void)

    public func apply(to subject: Subject) {
        switch self {
        case .custom(let styleClosure):
            styleClosure(subject)
        }
    }
}


// ===================  SwiftUI Support  ===================


public enum ZTSwiftUIStyle<Subject> where Subject: View {
    case custom((Subject) -> Subject)

    public func apply(to subject: Subject) -> Subject {
        switch self {
        case .custom(let styleClosure):
            return styleClosure(subject)
        }
    }
}

public extension View {
    func style(_ styles: ZTSwiftUIStyle<Self>...) -> some View {
        var copy = self
        styles.forEach { style in
            copy = style.apply(to:copy)
        }
        return copy
    }
}
