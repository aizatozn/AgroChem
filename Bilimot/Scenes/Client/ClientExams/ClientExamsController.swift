//
//  ClientExamsController.swift
//  Bilimot
//
//  Created by Aizat Ozbekova on 30/1/24.
//

import UIKit
import Combine

final class ClientExamsController: VMController<ClientExamsPresentable,
                                  ClientExamsViewModel> {

    override func onBindViewModel() {

        viewModel.counter
            .receive(on: DispatchQueue.main)
            .sink { [weak self] value in
            self?.content.clientExamsLabel.text = "\(value)"
        }.store(in: &viewModel.cancellables)
    }

    override func onConfigureActions() {

        content.clientExamsButton.addTarget(self,
                                         action: #selector(clientExamsButtonAction),
                                         for: .touchDown)

        content.nextButton.addTarget(self,
                                     action: #selector(nextButtonAction),
                                     for: .touchDown)
    }
}

private extension ClientExamsController {

    @objc private func clientExamsButtonAction() {
        let count = viewModel.counter.value
        viewModel.counter.send(count + 1)
    }

    @objc private func nextButtonAction() {
        viewModel.nextRoute.send()
    }
}
