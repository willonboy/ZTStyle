//
// ZTStyle.swift
//
// GitHub Repo and Documentation: https://github.com/willonboy/ZTStyle
//
// Copyright © 2024 Trojan Zhang. All rights reserved.
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.
//


import Foundation
import ZTChain

public extension ZTWrapper {
    @discardableResult
    func style(_ styles: ZTStyle<Subject>...) -> ZTWrapper {
        styles.forEach { style in
            style.style(to: subject)
        }
        return self
    }
}

public enum ZTStyle<Subject> {
    case custom((Subject) -> Void)

    func style(to subject: Subject) {
        switch self {
        case .custom(let styleClosure):
            styleClosure(subject)
        }
    }
}


