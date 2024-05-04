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

        viewModel.inName
            .dropFirst()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] names in
                guard let self = self else { return }
//                self.content.medicines = names
            }
            .store(in: &viewModel.cancellables)

        viewModel.outName
            .dropFirst()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] names in
                guard let self = self else  { return }
//                self.content.bobovyeСategories = names
            }
            .store(in: &viewModel.cancellables)
    }
}
