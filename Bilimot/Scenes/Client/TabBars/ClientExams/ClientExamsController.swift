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

        content.pushToLesson
            .dropFirst()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] index in
                guard let self = self else { return }
                self.viewModel.pushToLesson.send(index)
            }
            .store(in: &viewModel.cancellables)
    }

    override func onConfigureController() {
        title = "Сынамык"
    }
}
