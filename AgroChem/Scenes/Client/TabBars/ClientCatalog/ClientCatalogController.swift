//
//  ClientCatalogController.swift
//  Bilimot
//
//  Created by Aizat Ozbekova on 30/1/24.
//

import UIKit
import Combine

final class ClientCatalogController: VMController<ClientCatalogPresentable,
                                     ClientCatalogViewModel> {

    override func onConfigureController() {
        title = "Каталог"
    }
}
