//
//  ClientCoursesController.swift
//  Bilimot
//
//  Created by Aizat Ozbekova on 30/1/24.
//

import UIKit
import Combine

final class ClientCoursesController: VMController<ClientCoursesPresentable,
                                  ClientCoursesViewModel> {

    override func onBindViewModel() {

        viewModel.counter
            .receive(on: DispatchQueue.main)
            .sink { [weak self] value in
            self?.content.clientCoursesLabel.text = "\(value)"
        }.store(in: &viewModel.cancellables)
    }

    override func onConfigureActions() {

        content.clientCoursesButton.addTarget(self,
                                         action: #selector(clientCoursesButtonAction),
                                         for: .touchDown)

        content.nextButton.addTarget(self,
                                     action: #selector(nextButtonAction),
                                     for: .touchDown)
    }
}

private extension ClientCoursesController {

    @objc private func clientCoursesButtonAction() {
        let count = viewModel.counter.value
        viewModel.counter.send(count + 1)
    }

    @objc private func nextButtonAction() {
        viewModel.nextRoute.send()
    }
}
