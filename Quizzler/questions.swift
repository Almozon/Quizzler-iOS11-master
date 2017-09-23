//
//  questions.swift
//  Quizzler
//
//  Created by Sirmazin. on 1/2/1439 AH.
//  Copyright © 1439 London App Brewery. All rights reserved.
//

import Foundation

class Question {
    
    let questionsText: String
    let answer: Bool
    // com
    init(text: String , correctAnswer: Bool) {
        questionsText = text
        answer = correctAnswer
    }
}


