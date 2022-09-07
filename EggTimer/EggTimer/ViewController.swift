import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    //dictionary
    let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720]
        
    var timer = Timer()
    var player: AVAudioPlayer!
    var totalTime = 0
    var secondsPassed = 0
   

    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        //percentageProgress=secondsPassed /(divided) totalTime
        
        timer.invalidate()
        
        
        let hardness = sender.currentTitle! //Soft, Medium, Hard
        
       totalTime = eggTimes[hardness]!
        
        progressBar.progress = 0.0
        secondsPassed = 0
        titleLabel.text = hardness
        
       timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
       }
    
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            secondsPassed += 1
                        
            //let percentageProgress = secondsPassed / totalTime
            
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
            print(Float(secondsPassed) / Float(totalTime))
            
            
        } else {
            timer.invalidate()
            titleLabel.text = "Ready!"
            
            let url = Bundle.main.url(forResource: "Ready-267222", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }
    }
    
}

/*  If Statement Option
 //Constants
 let softTime = 5
 let mediumTime = 7
 let hardTime = 12
 
 @IBAction func hardnessSelected(_ sender: UIButton) {
 let hardness = sender.currentTitle
 
 if harness == "Soft" {
    print(softTime)
 } else if hardness == "Medium" {
    print(mediumTime)
 } else {
    print(hardTime)
 }
}
 */



/*  Switch Statement Option
 
 let softTime = 5
 let mediumTime = 7
 let hardTime = 12
 
 @IBAction func hardnessSelected(_ sender: UIButton) {
 let hardness = sender.currentTitle
 
 switch hardness {
case "Soft" :
    print(softTime)
 
 case "Medium":
    print(mediumTime)
 
 case "Hard" :
    print(hardTime)
 
 default:
    print("Error")
 }
 }
 */


