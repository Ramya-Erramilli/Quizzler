

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!

    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {

        let userAnswer = sender.currentTitle!
        if quizBrain.checkAnswer(userAnswer){
            sender.backgroundColor = UIColor.green
        }else{
            sender.backgroundColor = UIColor.red
        }
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { (timer) in
            self.updateUI()
        }
    }
    
    func updateUI(){
        questionLabel.text = quizBrain.getQuestion()
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
    }
    
}

