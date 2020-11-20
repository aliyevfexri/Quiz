//
//  Question.swift
//  Quiz
//
//  Created by Fakhri Aliyev on 11/11/20.
//

import Foundation

struct Question {
    
    var text: String
    var answer: String
    
    init(q: String , a: String) {
        text = q
        answer = a
    }
}
