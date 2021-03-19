//
//  MainAuctionPageViewModel.swift
//  goland
//
//  Created by Kusyumov Nikita on 25.02.2021.
//  Copyright © 2021 n.kusyumov@mail.ru. All rights reserved.
//

import UIKit

struct MainAuctionPageViewModel {
    
    var selectionApplied = false
    
    var categories: [Category] = []
    var slotInfo: [Slot] = []
    
}

struct Category {
    var id: String
    var name: String
}

struct Slot {
    var endDate: String
    var endTime: String
    var imageUrl: UIImage
    var name: String
    var isClosed: Bool
}

