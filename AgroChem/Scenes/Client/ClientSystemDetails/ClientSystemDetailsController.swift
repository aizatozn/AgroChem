//
//  ClientSystemDetailsController.swift
//  AgroChem
//
//  Created by Aizat Ozbekova on 15/4/24.
//

import UIKit
import Combine

final class ClientSystemDetailsController: VMController<ClientSystemDetailsPresentable,
                                           ClientSystemDetailsViewModel> {

    override func onBindViewModel() {

//        viewModel.directories
//            .receive(on: DispatchQueue.main)
//            .sink { [weak self] direcs in
//                guard let self = self else { return }
//                content.directories = direcs
//            }
//            .store(in: &viewModel.cancellables)
    }
}
