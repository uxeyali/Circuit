//
//  QuickStartController.swift
//  Circuit
//
//  Created by Ghazanfar, Uzma on 10/16/17.
//  Copyright © 2017 Ghazanfar, Uzma. All rights reserved.
//

import UIKit

class QuickStartController: UIViewController {
    
    private let background: UIImageView
    private let backButton: UIButton
    private var backImage: UIImage
    private let restartButton: UIButton
    private var restartImage: UIImage
    
    init(string: String){
        background = UIImageView()
        backButton = UIButton()
        backImage = UIImage()
        restartButton = UIButton()
        restartImage = UIImage()
        
        super.init(nibName: nil, bundle: nil)
        
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
        backButton.addTarget(self, action: #selector(QuickStartController.backButtonPressed), for: UIControlEvents.touchUpInside)
        self.view.addSubview(backButton)
        
        restartImage = UIImage(named: "restart.png")!
        restartButton.setImage(restartImage, for: UIControlState.normal)
        restartButton.frame = CGRect(x: screenSize.width - 80, y: 40, width: 48, height: 40)
        restartButton.isUserInteractionEnabled = true
        restartButton.addTarget(self, action: #selector(QuickStartController.backButtonPressed), for: UIControlEvents.touchUpInside)
        self.view.addSubview(restartButton)
        
    }
    
    @objc func backButtonPressed(){
        self.presentingViewController?.dismiss(animated: true, completion: { () -> Void in
//            NSLog("Secondary view controller dismissed...")
        })
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // Do any additional setup after loading the view, typically from a nib.
        let lc: LevelController = LevelController(string: "Level Controller")
        let levels = lc.levels
        
        for each in levels {
            if each.value.levelState == 1 && each.value.name == "1"{
                let v: Level1Controller = Level1Controller()
                v.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
                self.present(v, animated: true, completion: {
                    () -> Void in
                })
            } else if each.value.levelState == 1 && each.value.name == "2"{
                let v: ViewController = ViewController()
                v.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
                self.present(v, animated: true, completion: {
                    () -> Void in
                })
            }
    }
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
