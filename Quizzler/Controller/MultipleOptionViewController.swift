
import UIKit

class MultipleOptionViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var option1: UIButton!
    @IBOutlet weak var option2: UIButton!
    @IBOutlet weak var option3: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        updateUI()
//
//        option1.setTitle(quizBrain.quiz[0].answers[0], for: .normal)
//        option2.setTitle(quizBrain.quiz[0].answers[1], for: .normal)
//        option3.setTitle(quizBrain.quiz[0].answers[2], for: .normal)
    }
    @IBAction func answerSelected(_ sender: UIButton) {
    
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
        option1.setTitle(quizBrain.getOptions()[0], for: .normal)
        option2.setTitle(quizBrain.getOptions()[1], for: .normal)
        option3.setTitle(quizBrain.getOptions()[2], for: .normal)
        option1.backgroundColor = UIColor.clear
        option2.backgroundColor = UIColor.clear
        option3.backgroundColor = UIColor.clear
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
    }
    
    
}
