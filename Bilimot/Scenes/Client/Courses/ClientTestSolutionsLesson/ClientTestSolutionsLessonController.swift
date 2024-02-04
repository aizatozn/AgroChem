//
//  ClientTestSolutionsLessonController.swift
//  Bilimot
//
//  Created by Aizat Ozbekova on 2/3/24.
//

import UIKit
import Combine

final class ClientTestSolutionsLessonController:
            VMController<ClientTestSolutionsLessonPresentable,
            ClientTestSolitionsLessonViewModel> {

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
