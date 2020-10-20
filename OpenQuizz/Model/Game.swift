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
    
    func refresh() {
        score = 0
        currentIndex = 0
        state = .over
        
        QuestionManager.shared.get { (questions) in
            self.questions = questions
            self.state = .ongoing
        }
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
