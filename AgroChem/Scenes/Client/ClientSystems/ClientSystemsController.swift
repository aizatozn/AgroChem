//
//  ClientSystemsController.swift
//  AgroChem
//
//  Created by Aizat Ozbekova on 8/4/24.
//

import UIKit
import Combine

final class ClientSystemsController: VMController<ClientSystemsPresentable,
                                     ClientSystemsViewModel> {

    override func onConfigureController() {
        title = "Системы защиты"
        let backButton = UIBarButtonItem()
        backButton.title = ""
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
}
