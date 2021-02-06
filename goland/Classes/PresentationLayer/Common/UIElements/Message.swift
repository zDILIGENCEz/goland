//
//  Message.swift
//  goland
//
//  Created by Kusyumov Nikita on 27.08.2020.
//  Copyright © 2020 n.kusyumov@mail.ru. All rights reserved.
//

import SwiftEntryKit
import UIKit

enum MessageType {
    case simple
    case success
    case error
    
    var color: UIColor {
        switch self {
        case .simple:
            return UIColor.green.withAlphaComponent(0.95)
        case .success:
            return UIColor.red.withAlphaComponent(0.95)
        case .error:
            return UIColor.red.withAlphaComponent(0.95)
        }
    }
    
    var hapticType: EKAttributes.NotificationHapticFeedback {
        switch self {
        case .simple:
            return .none
        case .success:
            return .success
        case .error:
            return .error
        }
    }
    
}

struct Message {
    
    static let shared = Message()
    
    func showMessage(with text: String, type: MessageType) {
        let titleFont = UIFont.boldSystemFont(ofSize: 15)
        var attributes = EKAttributes.topToast
        attributes.entryBackground = .color(color: EKColor(type.color))
        attributes.popBehavior = .animated(animation: .init(translate: .init(duration: 0.3), scale: .init(from: 1, to: 0.7, duration: 0.7)))
        attributes.scroll = .enabled(swipeable: true, pullbackAnimation: .jolt)
        attributes.hapticFeedbackType = type.hapticType
        var title = EKProperty.LabelContent(text: text, style: .init(font: titleFont, color: .white))
        title.style.alignment = .center
        let contentView = EKNoteMessageView(with: title)
        SwiftEntryKit.display(entry: contentView, using: attributes)
    }
    
}

