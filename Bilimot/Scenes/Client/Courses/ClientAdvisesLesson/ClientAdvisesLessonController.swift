//
//  ClientAdvisesLessonController.swift
//  Bilimot
//
//  Created by Aizat Ozbekova on 2/3/24.
//

import UIKit
import Combine

final class ClientAdvisesLessonController: VMController<ClientAdvisesLessonPresentable,
                                             ClientAdvisesLessonViewModel> {

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

    override func onConfigureController() {
        let backButton = UIBarButtonItem()
        backButton.title = ""
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
}
