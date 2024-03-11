//
//  ClientHomeController.swift
//  Bilimot
//
//  Created by Aizat Ozbekova on 30/1/24.
//

import UIKit
import Combine

final class ClientHomeController: VMController<ClientHomePresentable,
                                  ClientHomeViewModel> {

    override func onConfigureController() {
        title = "AgroChem"
    }
}
