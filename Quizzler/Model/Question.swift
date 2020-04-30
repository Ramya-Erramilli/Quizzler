//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Ramya Seshagiri on 27/04/20.
//
//

import Foundation

struct Question {
    var text:String
//    var answer:String
    var answers:[String]
    var correctAnswer:String
    
//    init(q :String,a:String) {
//        text = q
//        answer = a
//    }
    
    
    init(q:String,a:[String],correctAnswer:String) {
        text = q
        answers = a
        self.correctAnswer = correctAnswer
    }
}
