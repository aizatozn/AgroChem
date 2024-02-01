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
