//
//  ViewController.swift
//  CurtainFall
//
//  Created by Moin on 01/26/2017.
//  Copyright (c) 2017 Moin. All rights reserved.
//

import UIKit
import CurtainFall

class ViewController: UIViewController,CurtainDelegate {

    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view1Line1: UIView!
    @IBOutlet weak var view1Line2: UIView!
    
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view2Line1: UIView!
    @IBOutlet weak var view2Line2: UIView!
    
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view3Line1: UIView!
    @IBOutlet weak var view3Line2: UIView!
    
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var view4Line1: UIView!
    @IBOutlet weak var view4Line2: UIView!
    
    let topBar : CurtainContainer = CurtainContainer();
    var myList : [CurtainStr] = [CurtainStr]();

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadCurtainDrop();
        
    }
    
    func loadCurtainDrop() -> Void {
        
        self.myList.removeAll();
        
        for i in 0..<4{
            let str : CurtainStr = CurtainStr();
            str.image = UIImage(named: "user");
            str.my_index = i;
            str.downArrowImage = UIImage(named: "down");
            switch i {
            case 0:
                str.title = "Moin";
                str.backgroundColor = UIColor(red: 218.0/255.0, green: 129.0/225.0, blue: 240.0/255.0, alpha: 1.0);
                break;
            case 1:
                str.title = "Jack";
                str.backgroundColor = UIColor(red: 255.0/255.0, green: 110.0/225.0, blue: 102.0/255.0, alpha: 1.0);
                break;
            case 2:
                str.title = "Bob";
                str.backgroundColor = UIColor(red: 142.0/255.0, green: 193.0/225.0, blue: 69.0/255.0, alpha: 1.0);
                break;
            case 3:
                str.title = "Alice";
                str.backgroundColor = UIColor(red: 0.0/255.0, green: 162.0/225.0, blue: 246.0/255.0, alpha: 1.0);                break;
            default:
                str.title = "Hulk";
                str.backgroundColor = UIColor(red: 218.0/255.0, green: 129.0/225.0, blue: 240.0/255.0, alpha: 1.0);
            }
            self.myList.append(str);
        }
        
        topBar.loadFrameAndData(frame: self.view.frame, listToAdd: self.myList);
        topBar.delegate = self;
        self.view.addSubview(topBar.mainView);
    }
    
    func curtainSelctedAtIndex(index: Int) {
        var backgroundColorSelected : UIColor = UIColor();
        var lineColorSelected : UIColor = UIColor();
        switch index {
        case 0:
            backgroundColorSelected = UIColor(red: 218.0/255.0, green: 129.0/225.0, blue: 240.0/255.0, alpha: 0.3);
            lineColorSelected = UIColor(red: 218.0/255.0, green: 129.0/225.0, blue: 240.0/255.0, alpha: 0.7);
            break;
        case 1:
            backgroundColorSelected = UIColor(red: 255.0/255.0, green: 110.0/225.0, blue: 102.0/255.0, alpha: 0.3);
            lineColorSelected = UIColor(red: 255.0/255.0, green: 110.0/225.0, blue: 102.0/255.0, alpha: 0.7);
            break;
        case 2 :
            backgroundColorSelected = UIColor(red: 142.0/255.0, green: 193.0/225.0, blue: 69.0/255.0, alpha: 0.3);
            lineColorSelected = UIColor(red: 142.0/255.0, green: 193.0/225.0, blue: 69.0/255.0, alpha: 0.7);
            break;
        case 3 :
            backgroundColorSelected = UIColor(red: 0.0/255.0, green: 162.0/225.0, blue: 246.0/255.0, alpha: 0.3);
            lineColorSelected = UIColor(red: 0.0/255.0, green: 162.0/225.0, blue: 246.0/255.0, alpha: 0.7);
            break;
        default:
            print("Not Possible He He");
        }
        
        self.view1.backgroundColor = backgroundColorSelected;
        self.view2.backgroundColor = backgroundColorSelected
        self.view3.backgroundColor = backgroundColorSelected
        self.view4.backgroundColor = backgroundColorSelected;
        
        self.view1Line1.backgroundColor = lineColorSelected
        self.view1Line2.backgroundColor = lineColorSelected
        self.view2Line1.backgroundColor = lineColorSelected
        self.view2Line2.backgroundColor = lineColorSelected
        self.view3Line1.backgroundColor = lineColorSelected
        self.view3Line2.backgroundColor = lineColorSelected
        self.view4Line1.backgroundColor = lineColorSelected
        self.view4Line2.backgroundColor = lineColorSelected;
        
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    

    

}

