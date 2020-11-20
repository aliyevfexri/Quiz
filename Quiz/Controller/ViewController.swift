//
//  ViewController.swift
//  Quiz
//
//  Created by Fakhri Aliyev on 11/11/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var pointCount: UILabel!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateQuestion()
    }

    @IBAction func buttonTouchUpInside(_ sender: UIButton) {
        //Check answer whether true or false
        let isUserTrue = quizBrain.checkAnswear(sender.currentTitle!)
        if isUserTrue {
            sender.backgroundColor = UIColor.green
        }else{
            sender.backgroundColor = UIColor.red
        }
        
        //Check next question
        if quizBrain.nextQuestion() == false {
            let alert = UIAlertController(title: "Quiz bitmişdir !", message: "Sizin doğru cavab sayınız : \(quizBrain.endingPoint)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Yenidən başla", style: .default, handler: nil))
            self.present(alert, animated: true)
            
        }
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector (updateQuestion), userInfo: nil, repeats: false)
    }
    
  @objc  func updateQuestion () {
    questionLabel.text = quizBrain.getQuestion()
    
    let currentPoint = quizBrain.getCurrentPoint()
    pointCount.text = "Doğru Cavab: \(currentPoint)"
    
    trueButton.backgroundColor = UIColor.clear
    falseButton.backgroundColor = UIColor.clear
    }
    
}

