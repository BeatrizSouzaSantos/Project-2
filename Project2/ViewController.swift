//
//  ViewController.swift
//  Project2
//
//  Created by user on 21/07/21.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - IBOutlats
    
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String] ()
    var score = 0
    var scoreCounter = 0
    //randomizacao automatica
    var correctAnswer = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        //colocando borda nas imagens
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        //colocando cores nas bordas
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        //chamando funcao
        askQuestion()
    }
    
    //exibindo imagem
    //exibindo alerta
    func askQuestion(action: UIAlertAction! = nil){
        //colocnado a visualizacao em ordem
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        //mostrando nome na topbar
        title = countries[correctAnswer].uppercased() + "   score \(score)"
    }
    // MARK: - IBActions
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        var title: String

        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
            scoreCounter += 1
        } else {
            title = "Wrong! This is \(countries[correctAnswer].uppercased())"
            score -= 1
            scoreCounter += 1
    }
        
        //alerta
        if scoreCounter < 10 {
        let ac = UIAlertController(title: title, message: "Your score is \(score).", preferredStyle: .alert)
        // colocando botao no alerta
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(ac, animated: true)
        } else {
            let ac = UIAlertController(title: title, message: "End the Game. You guessed right \(score)", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Try again", style: .default, handler: askQuestion))
            present(ac, animated: true)
            
            score = 0
            scoreCounter = 0
        
    }
    
    

}

}
