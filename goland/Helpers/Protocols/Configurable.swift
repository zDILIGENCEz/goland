//
//  Configurable.swift
//  goland
//
//  Created by Kusyumov Nikita on 27.08.2020.
//  Copyright © 2020 n.kusyumov@mail.ru. All rights reserved.
//

import UIKit

/// Определяет возможность настройки представления
protocol Configurable where Self: UIView {
    associatedtype ViewModel
    
    /// Настраивает отображение
    ///
    /// - Parameter viewModel: Модель представления для конфигурации
    func configure(with viewModel: ViewModel)
}
