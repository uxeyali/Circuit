//
//  LevelController.swift
//  Circuit
//
//  Created by Ghazanfar, Uzma on 10/18/17.
//  Copyright © 2017 Ghazanfar, Uzma. All rights reserved.
//

import UIKit

class LevelController: UIViewController {
    
    
    private let background: UIImageView
    private let backButton: UIButton
    private var backImage: UIImage
    private let restartButton: UIButton
    private var restartImage: UIImage
//    private let label: UILabel
    
//  IMAGES FOR LEVELS & BUTTONS
    public var level1 = Level()
    public var level2 = Level()
    public var level3 = Level()
    public var level4 = Level()
    public var level5 = Level()
    public var levels: [Int: Level]
    
    init(string: String){
        background = UIImageView()
        backButton = UIButton()
        backImage = UIImage()
        restartButton = UIButton()
        restartImage = UIImage()
        
        
//      INSTANTITING LEVELS
        level1 = Level()
        level2 = Level()
        level3 = Level()
        level4 = Level()
        level5 = Level()
        levels = [Int: Level]()
        
        super.init(nibName: nil, bundle: nil)
        createLevels()
        
    }
    
    func createLevels(){
        let screenSize: CGSize = UIScreen.main.bounds.size
        // create variables that save the mid point of the screen - by width and height
        //        let centerX: CGFloat = screenSize.width/2
        //        let centerY: CGFloat = screenSize.height/2
        
        //      ---------------------------------------------------------------------------
        
        background.frame = CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height)
        background.image = UIImage(named: "Artwork.png")
        background.isHidden = false
        self.view.addSubview(background)
        
        //      ---------------------------------------------------------------------------
        
        backImage = UIImage(named: "back.png")!
        backButton.setImage(backImage, for: UIControlState.normal)
        backButton.frame = CGRect(x: 20, y: 40, width: 40, height: 40)
        backButton.isUserInteractionEnabled = true
        backButton.addTarget(self, action: #selector(LevelController.backButtonPressed), for: UIControlEvents.touchUpInside)
        self.view.addSubview(backButton)
        
        restartImage = UIImage(named: "restart.png")!
        restartButton.setImage(restartImage, for: UIControlState.normal)
        restartButton.frame = CGRect(x: screenSize.width - 80, y: 40, width: 48, height: 40)
        restartButton.isUserInteractionEnabled = true
        restartButton.addTarget(self, action: #selector(QuickStartController.backButtonPressed), for: UIControlEvents.touchUpInside)
        self.view.addSubview(restartButton)
        
//        label.frame = CGRect(x: 0, y: screenSize.height - 100, width: 500, height: 27)
//        label.textColor = UIColor.white
//        label.font = label.font.withSize(10.0)
//        label.lineBreakMode = NSLineBreakMode.byWordWrapping
//        label.numberOfLines = 0
//        label.text = "I am here!"
//        self.view.addSubview(label)
        
        
        
        let cell1 = screenSize.width/5
        
        //        ----- LEVEL 1 ----------
        level1.image = UIImage(named: "level1.png")!
        level1.frame = CGRect(x: cell1, y: 130, width: 80, height: 92)
        level1.isUserInteractionEnabled = true
        level1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(LevelController.level1buttonPressed(_:))))
        self.view.addSubview(level1)
        
        level2.frame = CGRect(x: cell1*2, y: 130, width: 80, height: 92)
        level3.frame = CGRect(x: cell1*3, y: 130, width: 80, height: 92)
        level4.frame = CGRect(x: 42 + cell1, y: 202, width: 80, height: 92)
        level5.frame = CGRect(x: 42 + (cell1*2), y: 202, width: 80, height: 92)
        level2.name = "level2"
        level3.name = "level3"
        level4.name = "level4"
        level5.name = "level5"
        
        //        ===========================
        //                  Levels
        //        ===========================
        
        levels = [2: level2, 3: level3, 4: level4, 5: level5]
        
        for level in levels{
            if level.value.levelState == 0 {
                level.value.image = UIImage(named: "\(level.value.name)gray.png")
                self.view.addSubview(level.value)
            } else if level.value.levelState == 1 {
                level.value.image = UIImage(named: "\(level.value.name)")
                level.value.isUserInteractionEnabled = true
                level.value.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(LevelController.level1buttonPressed(_:))))
                self.view.addSubview(level.value)
            } else if level.value.levelState == 2 {
                level.value.isUserInteractionEnabled = true
                level.value.image = UIImage(named: "\(level.value.name)gold")
                self.view.addSubview(level.value)
            }
            
        }
        
//        self.label.text = "\(levels[2]?.levelState) and \(levels[2]?.name)"
        
        
    }
    
    func changeLevel1State(state: Int){
        level2.levelState = state
    }
    
    @objc func level1buttonPressed(_ recognizer: UITapGestureRecognizer){
        let l1c: Level1Controller = Level1Controller()
        l1c.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        self.present(l1c, animated: true) { () -> Void in
            //            NSLog("Secondary view controller presented...")
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func backButtonPressed(){
        self.presentingViewController?.dismiss(animated: true, completion: { () -> Void in
            //            NSLog("Secondary view controller dismissed...")
        })
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
