//
//  ClientChemTestController.swift
//  Bilimot
//
//  Created by Aizat Ozbekova on 4/2/24.
//

import UIKit
import Combine

final class ClientChemTestController: VMController<ClientChemTestPresentable,
                                             ClientChemTestViewModel> {

    override func onBindViewModel() {

        content.pushToLesson
            .dropFirst()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] name in
                guard let self = self else { return }
                self.viewModel.pushToLesson.send(name)
            }
            .store(in: &viewModel.cancellables)
    }
}
