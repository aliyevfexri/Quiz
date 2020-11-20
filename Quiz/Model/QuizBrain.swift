//
//  QuizBrain.swift
//  Quiz
//
//  Created by Fakhri Aliyev on 11/13/20.
//

import UIKit

struct QuizBrain {
    
    var currentQuestion = 0
    var endingPoint = 0
    var currentPoint = 0
    var question = [
        Question(q: "2 vur 2 = 256", a: "Yanlış"),
        Question(q: "Fibula insan bədənində ayaqda yerləşir", a: "Doğru"),
        Question(q: "Dunya gozeldir", a: "Yanlış"),
        Question(q: "Beatles 1970-ci ildə dağıldı", a: "Doğru"),
        Question(q: "Ən çox peyki olan planet Saturn-dur", a: "Doğru")
    ]
    
    mutating func checkAnswear (_ userAnswear: String) -> Bool {
        if userAnswear == question[currentQuestion].answer {
            currentPoint += 1
            return true
        } else {
            return false
        }
    }
    
    mutating func nextQuestion() -> Bool {
        if currentQuestion + 1 < question.count {
            currentQuestion += 1
            return true
        } else {
            endingPoint = currentPoint
            currentQuestion = 0
            currentPoint = 0
            return false
        }
    }
    
    func getQuestion() -> String {
        return question[currentQuestion].text
    }
    
    func getCurrentPoint() -> Int {
        return currentPoint
    }
}
