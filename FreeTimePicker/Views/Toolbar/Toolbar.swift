//
//  Toolbar.swift
//  TimePicker
//
//  Created by Kazuya Ueoka on 2020/02/09.
//  Copyright © 2020 fromKK. All rights reserved.
//

import Combine
import UIKit

final class Toolbar: UIToolbar {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
    }

    private lazy var setUp: () -> Void = {
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        setItems([flexibleSpace, completionButton], animated: false)
        return {}
    }()

    let completion: PassthroughSubject<Void, Never> = .init()
    lazy var completionButton: UIBarButtonItem = {
        let item = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(tap(completionButton:)))
        item.accessibilityIdentifier = "completionButton"
        return item
    }()

    @objc func tap(completionButton _: UIBarButtonItem) {
        completion.send(())
    }
}
