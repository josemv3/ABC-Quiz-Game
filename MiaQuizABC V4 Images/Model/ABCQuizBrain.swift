//
//  ABCQuizBrain.swift
//  MiaQuizABC V4 Images
//
//  Created by Joey Rubin on 6/8/21.
//

import Foundation

struct ABCQuizBrain {

    let quiz = [

        ABCQuiz(i1: 0, i2: 1, i3: 2, a1: 0, a2: 1, a3: 2, tI: "a", bI: "b", c: "a"),
        ABCQuiz(i1: 3, i2: 4, i3: 5, a1: 3, a2: 4, a3: 5, tI: "b", bI: "c", c: "b"),
        ABCQuiz(i1: 6, i2: 7, i3: 8, a1: 6, a2: 7, a3: 8, tI: "c", bI: "d", c: "c"),
        ABCQuiz(i1: 9, i2: 10, i3: 11, a1: 9, a2: 10, a3: 11, tI: "c", bI: "d", c: "d")
    ]

    let names = [
    "apple","ant","airplane",
    "bat","ball","books",
    "cat", "car", "candy",
    "dog", "diaper", "drum"
    ]
    
    var currentImage = 0
    var quizNumber = 0
    var score = 0

    func getMainImage1() -> String {
        let image = quiz[quizNumber].image1
        return names[image]
    }
    
    func getMainImage2() -> String {
        let image = quiz[quizNumber].image2
        return names[image]
    }
    
    func getMainImage3() -> String {
        let image = quiz[quizNumber].image3
        return names[image]
    }
    
    func getMainAudio1() -> String {
        let audio = quiz[quizNumber].audio1
        return names[audio]
    }
    
    func getMainAudio2() -> String {
        let audio = quiz[quizNumber].audio2
        return names[audio]
    }
    
    func getMainAudio3() -> String {
        let audio = quiz[quizNumber].audio3
        return names[audio]
    }
    
    func getTopButtonImage() -> String {
        return quiz[quizNumber].topButtonImage
    }
    
    func getBottomButtonImage() -> String {
        return quiz[quizNumber].bottomButtonImage
    }
    
//    func getCorrectA () -> String {
//        return quiz[quizNumber].correct
//    }
    
    func getProgress() -> Float {
        let progress =  Float (quizNumber + 1) / Float (quiz.count)
        return progress
    }
    
    mutating func nextQuestion() {
        if quizNumber + 1 < quiz.count{
            quizNumber += 1
        } else {
            quizNumber = 0
            score = 0
        }
    }
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool{
        if userAnswer == quiz[quizNumber].correct {
            score += 1
            //print(score)
            return true
        } else {
            return false
        }
    }
    
    
  
    

}
