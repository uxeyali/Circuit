//
//  Level1Controller.swift
//  Circuit
//
//  Created by Ghazanfar, Uzma on 10/31/17.
//  Copyright © 2017 Ghazanfar, Uzma. All rights reserved.
//

import UIKit

class Level1Controller: UIViewController {
    
    //    creating the fileManager. So it is the default manager. This is provided for us
    let fileManager: FileManager = FileManager.default
    //    this is the file that will be saving the state file
    let filePath: String = "\(NSHomeDirectory())/tmp/circuit.txt"
    
    private let background: UIImageView
    private let backButton: UIButton
    private var backImage: UIImage
    private let restartButton: UIButton
    private var restartImage: UIImage
    
    
//    ===== TILES DECLARATION ========
    private var tile0Img: Piece
    private var tile1Img: Piece
    private var tile2Img: Piece
    private var tile3Img: Piece
    private var tile4Img: Piece
    private var tile5Img: Piece
    private var tile6Img: Piece
    private var tile7Img: Piece
    private var tile8Img: Piece
    private var tile9Img: Piece
    private var tile10Img: Piece
    private var tile11Img: Piece
    private var tile12Img: Piece
    private var tile13Img: Piece
    private var tile14Img: Piece
    private var tile15Img: Piece
    private var tile16Img: Piece
    
    private var rotation: UILabel
    
    private var pieces: [Piece]

    var screenSize: CGSize
    
    init(){
//        evaluates to the actual path for your apps home directory
        let dirPath: String = "\(NSHomeDirectory())/tmp/directory"
//        Objective C Bool value - can pass a reference to it.
        var isDir: ObjCBool = true
//        the & allows us to pass a reference to this object in C. &isDir allows us to assign the value dirPath returns and stick it into isDir.
        if fileManager.fileExists(atPath: dirPath, isDirectory: &isDir) {
            if isDir.boolValue {
                NSLog("file exists and is a directory")
            }
            else {
                NSLog("file exists and is not a directory")
            }
        }
        else {
            NSLog("file does not exist")
            do {
//                this is how we create a directory
                try fileManager.createDirectory(atPath: dirPath, withIntermediateDirectories: true, attributes: nil)
            }
            catch {
                NSLog("directory not created")
            }
        }
        
        background = UIImageView()
        backButton = UIButton()
        backImage = UIImage()
        restartButton = UIButton()
        restartImage = UIImage()
        
        
//    ===== TILES INITIALIZATION ========
        tile0Img = Piece()
        tile1Img = Piece()
        tile2Img = Piece()
        tile3Img = Piece()
        tile4Img = Piece()
        tile5Img = Piece()
        tile6Img = Piece()
        tile7Img = Piece()
        tile8Img = Piece()
        tile9Img = Piece()
        tile10Img = Piece()
        tile11Img = Piece()
        tile12Img = Piece()
        tile13Img = Piece()
        tile14Img = Piece()
        tile15Img = Piece()
        tile16Img = Piece()
        rotation = UILabel()
        screenSize = CGSize()
        pieces = [Piece]()
        
        super.init(nibName: nil, bundle: nil)
      
        screenSize = UIScreen.main.bounds.size
        
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
        backButton.addTarget(self, action: #selector(Level1Controller.backButtonPressed), for: UIControlEvents.touchUpInside)
        self.view.addSubview(backButton)

        restartImage = UIImage(named: "restart.png")!
        restartButton.setImage(restartImage, for: UIControlState.normal)
        restartButton.frame = CGRect(x: screenSize.width - 80, y: 40, width: 48, height: 40)
        restartButton.isUserInteractionEnabled = true
        restartButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(Level1Controller.resetButtonPressed(_:))))
        self.view.addSubview(restartButton)
        
        //      ---------------------------------------------------------------------------
    
        createBoard()
        
    }
    
    func createBoard(){
        
        rotation.frame = CGRect(x: 0, y: screenSize.height - 100, width: 500, height: 27)
        rotation.textColor = UIColor.white
        rotation.font = rotation.font.withSize(10.0)
        rotation.lineBreakMode = NSLineBreakMode.byWordWrapping
        rotation.numberOfLines = 0
        self.view.addSubview(rotation)
       
        setWires()
        
        setNeighbors()
        setBoard()
    }
    
    func setNeighbors(){
        
        tile7Img.neighbors[1] = tile4Img
        
        tile8Img.neighbors[2] = tile9Img
        
        tile9Img.neighbors[4] = tile12Img
        
        tile11Img.neighbors[0] = tile7Img
        
        tile12Img.neighbors[5] = tile11Img
    }
    
    func setWires(){
        
        tile8Img.wires[2] = true
        tile8Img.powered = true
        
        tile9Img.wires[0] = true
        tile9Img.wires[1] = true
        
        tile4Img.wires[4] = true
        
        tile7Img.wires[0] = true
        tile7Img.wires[4] = true
        
        tile11Img.wires[0] = true
        tile11Img.wires[2] = true
        tile11Img.wires[4] = true
        
        tile12Img.wires[2] = true
        tile12Img.wires[4] = true
    }
    
    func setBoard(){
        
        //        ------ TILES ----------
        let cell = self.screenSize.width/5.5
        let cell1row1 = cell+10
        let cell2row1 = cell*2 + 10
        let cell3row1 = cell*3 + 10
        let cell1row2 = cell-27
        let cell2row2 = cell*2-27
        let cell3row2 = cell*3-27
        let cell4row2 = cell*4-27
        let heightcellrow1: CGFloat = 130.0
        let heightcellrow2: CGFloat = heightcellrow1+65
        let heightcellrow3: CGFloat = heightcellrow2+65
        let heightcellrow4: CGFloat = heightcellrow3+65
        let heightcellrow5: CGFloat = heightcellrow4+65
        
        self.tile0Img.image = UIImage(named: "0.png")
        self.tile0Img.frame = CGRect(x: cell1row1, y: heightcellrow1, width: 80, height: 92)
        self.tile0Img.isUserInteractionEnabled = false
        self.tile0Img.name = "0"
        self.view.addSubview(self.tile0Img)
        
        tile1Img.image = UIImage(named: "1.png")
        tile1Img.frame = CGRect(x: cell2row1, y: heightcellrow1, width: 80, height: 92)
        tile1Img.isUserInteractionEnabled = false
        self.tile1Img.name = "1"
        self.view.addSubview(tile1Img)
        
        tile2Img.image = UIImage(named: "2.png")
        tile2Img.frame = CGRect(x: cell3row1, y: heightcellrow1, width: 80, height: 92)
        tile2Img.isUserInteractionEnabled = false
        self.tile2Img.name = "2"
        self.view.addSubview(tile2Img)
        
        tile3Img.image = UIImage(named: "3.png")
        tile3Img.frame = CGRect(x: cell1row2, y: heightcellrow2, width: 80, height: 92)
        tile3Img.isUserInteractionEnabled = false
        self.tile3Img.name = "2"
        self.view.addSubview(tile3Img)
        
        tile5Img.image = UIImage(named: "5.png")
        tile5Img.frame = CGRect(x: cell3row2, y: heightcellrow2, width: 80, height: 92)
        tile5Img.isUserInteractionEnabled = false
        self.tile5Img.name = "5"
        self.view.addSubview(tile5Img)
        
        tile6Img.image = UIImage(named: "6.png")
        tile6Img.frame = CGRect(x: cell4row2, y: heightcellrow2, width: 80, height: 92)
        tile6Img.isUserInteractionEnabled = false
        self.tile6Img.name = "6"
        self.view.addSubview(tile6Img)
        
        tile10Img.image = UIImage(named: "10.png")
        tile10Img.frame = CGRect(x: cell1row2, y: heightcellrow4, width: 80, height: 92)
        tile10Img.isUserInteractionEnabled = false
        self.tile10Img.name = "10"
        self.view.addSubview(tile10Img)
        
        tile13Img.image = UIImage(named: "13.png")!
        tile13Img.frame = CGRect(x: cell4row2, y: heightcellrow4, width: 80, height: 92)
        tile13Img.isUserInteractionEnabled = false
        self.tile13Img.name = "13"
        self.view.addSubview(tile13Img)
        
        tile14Img.image = UIImage(named: "14.png")
        tile14Img.frame = CGRect(x: cell1row1, y: heightcellrow5, width: 80, height: 92)
        tile14Img.isUserInteractionEnabled = false
        self.tile14Img.name = "14"
        self.view.addSubview(tile14Img)
        
        tile15Img.image = UIImage(named: "15.png")
        tile15Img.frame = CGRect(x: cell2row1, y: heightcellrow5, width: 80, height: 92)
        tile15Img.isUserInteractionEnabled = false
        self.tile15Img.name = "15"
        self.view.addSubview(tile15Img)
        
        tile16Img.image = UIImage(named: "16.png")
        tile16Img.frame = CGRect(x: cell3row1, y: heightcellrow5, width: 80, height: 92)
        tile16Img.isUserInteractionEnabled = false
        self.tile16Img.name = "16"
        self.view.addSubview(tile16Img)
        
        tile9Img.image = UIImage(named: "9.png")
        tile9Img.frame = CGRect(x: cell3row1, y: heightcellrow3, width: 80, height: 92)
        tile9Img.isUserInteractionEnabled = true
        tile9Img.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(Level1Controller.rotatePiece(_:))))
        self.tile9Img.name = "9"
        self.view.addSubview(tile9Img)
        
        tile4Img.image = UIImage(named: "4.png")
        tile4Img.frame = CGRect(x: cell2row2, y: heightcellrow2, width: 81, height: 92)
        tile4Img.isUserInteractionEnabled = false
        self.tile4Img.name = "4"
        self.view.addSubview(tile4Img)
        
        tile7Img.image = UIImage(named: "7")
        tile7Img.frame = CGRect(x: cell1row1, y: heightcellrow3, width: 80, height: 92)
        tile7Img.isUserInteractionEnabled = true
        tile7Img.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(Level1Controller.rotatePiece(_:))))
        self.tile7Img.name = "7"
        self.view.addSubview(tile7Img)
        
        tile11Img.image = UIImage(named: "11.png")
        tile11Img.frame = CGRect(x: cell2row2, y: heightcellrow4, width: 80, height: 92)
        tile11Img.isUserInteractionEnabled = true
        tile11Img.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(Level1Controller.rotatePiece(_:))))
        self.tile11Img.name = "11"
        self.view.addSubview(tile11Img)
        
        tile12Img.image = UIImage(named: "12.png")!
        tile12Img.frame = CGRect(x: cell3row2, y: heightcellrow4, width: 80, height: 92)
        tile12Img.isUserInteractionEnabled = true
        tile12Img.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(Level1Controller.rotatePiece(_:))))
        self.tile12Img.name = "12"
        self.view.addSubview(tile12Img)
        
        tile8Img.image = UIImage(named: "8.png")
        tile8Img.frame = CGRect(x: cell2row1, y: heightcellrow3, width: 80, height: 92)
        tile8Img.isUserInteractionEnabled = true
        self.tile8Img.name = "8"
        self.view.addSubview(tile8Img)
        
        self.pieces = [tile1Img, tile2Img, tile3Img, tile4Img, tile5Img, tile6Img, tile7Img, tile8Img, tile9Img, tile10Img, tile11Img, tile12Img, tile13Img, tile14Img, tile15Img, tile16Img]
    }
    
    
    private func deletePuzzleStateFile() {
        do {
            try fileManager.removeItem(atPath: filePath)
        }
        catch {
            
        }
        let dirEnumerator: FileManager.DirectoryEnumerator = fileManager.enumerator(atPath: NSHomeDirectory())!
        var currentPath: String? = dirEnumerator.nextObject() as! String?
        while currentPath != nil {
            NSLog(currentPath!)
            currentPath = dirEnumerator.nextObject() as! String?
        }
    }
    
    @objc func rotatePiece(_ recognizer: UITapGestureRecognizer) {
        Piece.animate(withDuration: 0.1, animations: { () -> Void in
            let view = recognizer.view! as! Piece
            let rotation = (view.rotation + 1)%6
            recognizer.view?.transform = CGAffineTransform(rotationAngle: CGFloat(((Double.pi)/3)*Double(rotation)))
            
            view.rotation = (view.rotation + 1) % 6
            self.tile7Img.image = UIImage(named: "7.png")
            self.tile7Img.powered = false
            self.tile9Img.image = UIImage(named: "9.png")
            self.tile9Img.powered = false
            self.tile11Img.image = UIImage(named: "11.png")
            self.tile11Img.powered = false
            self.tile12Img.image = UIImage(named: "12.png")
            self.tile12Img.powered = false
            
            self.rotateEdges(piece: view)
            
            self.checkforYellow(piece: self.tile8Img, used: 0)
            }, completion: {
                (Bool) -> Void in
            })
            savePuzzleState()
        
    }
    
    @objc func backButtonPressed(){
        self.presentingViewController?.dismiss(animated: true, completion: { () -> Void in
        })
    }
    
    @objc func resetButtonPressed(_ recognizer: UITapGestureRecognizer){
        for tile in pieces{
            tile.wires = [false, false, false, false, false, false]
            tile.neighbors = [0: nil, 1: nil, 2: nil, 3: nil, 4: nil, 5: nil]
            tile.powered = false
            tile.image = UIImage(named: "\(tile.name).png")
            tile.transform = CGAffineTransform(rotationAngle: CGFloat((-1*(Double.pi)/3) * Double((6-tile.rotation)%6)))
            tile.rotation = 0
        }
        setWires()
        setNeighbors()
        deletePuzzleStateFile()
    }
    
    func rotateEdges(piece: Piece){
        var indexes = [Int]()
        for index in 0..<piece.wires.count{
            if piece.wires[index] == true {
                indexes.append((index%6))
                piece.wires[index%6] = false
            }
        }
        
        if indexes.count == 0{
        } else{
            for each in 0..<indexes.count{
                piece.wires[(indexes[each]+1)%6] = true
            }

        }
        
    }
    
    func checkforYellow(piece: Piece, used: Int){
        gamePassed(piece: piece)
        let trueIdxs = piece.wires.enumerated().filter { $1 }.map { $0.0 }
        
        if piece.powered{
            for each in trueIdxs{
                for (place, neigh) in piece.neighbors{
                    if neigh != nil && place == each && (used+3)%6 != each && neigh!.wires[(each+3)%6] {
                            neigh!.image = UIImage(named: "\(neigh!.name)gold")
                            neigh!.powered = true
                            checkforYellow(piece: neigh!, used: ((each)))
                        }
                }
            }
        }
    }

    func gamePassed(piece: Piece){
        if piece.powered && piece.neighbors[1]??.name == "4" {
            piece.neighbors[1]??.image = UIImage(named: "4gold.png")
            piece.neighbors[1]??.powered = true
            self.tile7Img.isUserInteractionEnabled = false
            self.tile9Img.isUserInteractionEnabled = false
            self.tile11Img.isUserInteractionEnabled = false
            self.tile12Img.isUserInteractionEnabled = false
            
            let levelControl: LevelController = self.presentingViewController as! LevelController
            levelControl.level1.levelState = 2
            levelControl.level2.levelState = 1
            
            self.presentingViewController?.dismiss(animated: true, completion: { () -> Void in
              levelControl.createLevels()
            })
        }
    }
    
    private func savePuzzleState() {
        let data: Data? = NSKeyedArchiver.archivedData(withRootObject: pieces)
//        //        creating a new file
        if fileManager.createFile(atPath: filePath, contents: data, attributes: nil) {
            NSLog("File successfully created")
        }
        else {
            NSLog("Error creating file")
        }
        let dirEnumerator: FileManager.DirectoryEnumerator = fileManager.enumerator(atPath: NSHomeDirectory())!
        var currentPath: String? = dirEnumerator.nextObject() as! String?
        while currentPath != nil {
            NSLog(currentPath!)
            currentPath = dirEnumerator.nextObject() as! String?
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
