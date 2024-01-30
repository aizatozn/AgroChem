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

    override func onBindViewModel() {

        viewModel.counter
            .receive(on: DispatchQueue.main)
            .sink { [weak self] value in
            self?.content.clientHomeLabel.text = "\(value)"
        }.store(in: &viewModel.cancellables)
    }

    override func onConfigureActions() {

        content.clientHomeButton.addTarget(self,
                                         action: #selector(clientHomeButtonAction),
                                         for: .touchDown)

        content.nextButton.addTarget(self,
                                     action: #selector(nextButtonAction),
                                     for: .touchDown)
    }
}

private extension ClientHomeController {

    @objc private func clientHomeButtonAction() {
        let count = viewModel.counter.value
        viewModel.counter.send(count + 1)
    }

    @objc private func nextButtonAction() {
        viewModel.nextRoute.send()
    }
}
