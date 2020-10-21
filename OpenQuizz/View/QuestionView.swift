//
//  QuestionView.swift
//  OpenQuizz
//
//  Created by Michael Carrasco on 21/10/2020.
//

import UIKit

class QuestionView: UIView {
    @IBOutlet private var label: UILabel!
    @IBOutlet private var icon: UIImageView!
    enum Style {
        case correct, incorrect, standard
    }
    private func setStyle(_ style: Style) {
        switch style {
        case .correct:
            self.backgroundColor = UIColor(red: 200/255.0, green: 236/255.0, blue: 160/255.0, alpha: 1)
            icon.image = UIImage(named: "Icon Correct")
            icon.isHidden = false
        case .incorrect:
            self.backgroundColor = UIColor(red: 243.0/255.0, green: 135.0/255.0, blue: 148.0/255.0, alpha: 1)
            icon.image = UIImage(named: "Icon Error")
            icon.isHidden = false
        case .standard:
            self.backgroundColor = UIColor(red: 191.0/255.0, green: 196.0/255.0, blue: 201.0/255.0, alpha: 1)
            icon.isHidden = true
        }
    }
    var style: Style = .standard {
        didSet {
            setStyle(style)
        }
    }
    var title: String = "" {
        didSet {
            label.text = title
        }
    }
    
}
