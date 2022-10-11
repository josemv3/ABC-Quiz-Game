//
//  ABCQuiz.swift
//  MiaQuizABC V4 Images
//
//  Created by Joey Rubin on 6/8/21.
//

import Foundation

struct ABCQuiz { //call this question
    let image1: Int
    let image2: Int
    let image3: Int
    let audio1: Int
    let audio2: Int
    let audio3: Int
    let topButtonImage: String
    let bottomButtonImage: String
    let correct: String //call this answer

    init(i1: Int, i2: Int, i3: Int, a1: Int, a2: Int, a3: Int, tI: String, bI: String, c: String) {

        image1 = i1
        image2 = i2
        image3 = i3
        audio1 = a1
        audio2 = a2
        audio3 = a3
        topButtonImage = tI
        bottomButtonImage = bI
        correct = c
    }
}
