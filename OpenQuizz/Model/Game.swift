//
//  Game.swift
//  OpenQuizz
//
//  Created by Michael Carrasco on 20/10/2020.
//

import Foundation

class Game {
    var score = 0
    private var questions = [Question]()
    private var currentIndex = 0
    enum State {
        case ongoing, over
    }
    var state: State = .ongoing
    var currentQuestion: Question {
        return questions[currentIndex]
    }
    
    private func receiveQuestions(_ questions: [Question]) {
        self.questions = questions
        print(questions)
        state = .ongoing
    }
    func refresh() {
        score = 0
        currentIndex = 0
        state = .over
        
        QuestionManager.shared.get(completionHandler: receiveQuestions(_:))
    }
    func answerCurrentQuestion(with answer: Bool) {
        if (currentQuestion.isCorrect && answer) || (!currentQuestion.isCorrect && !answer) {
            score += 1
        }
        goToNextQuestion()
    }
    private func goToNextQuestion() {
        if currentIndex < questions.count - 1 {
            currentIndex += 1
        } else {
            finishGame()
        }
    }
    private func finishGame() {
        state = .over
    }
}
