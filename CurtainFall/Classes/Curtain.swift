//
//  Curtain.swift
//  Pods
//
//  Created by Moin on 26/01/17.
//
//

import UIKit
import Foundation

public class Curtain: NSObject {
    
    public let mainView : UIView = UIView();
    
    public let label : UILabel = UILabel();
    public let center_image : UIImageView = UIImageView();
    let button : UIButton = UIButton();
    public var index : Int = 0;
    var labelInitialPostion : CGRect? = nil;
    let additional_image : UIImageView = UIImageView();
    
    var my_background : UIColor = UIColor(){
        didSet{
            self.mainView.backgroundColor = my_background;
        }
    }
    
    public var myData : CurtainStr = CurtainStr(){
        didSet{
            self.center_image.image = myData.image;
            self.label.text = myData.title;
            self.my_background = myData.backgroundColor;
            self.index = myData.my_index;
            self.additional_image.image = myData.downArrowImage!;
        }
    }

    public override init() {
        super.init();
    }
    
    public func loadFrame(frame : CGRect){
        self.mainView.frame = frame;
        loadUI();
    }
    
    func loadUI() -> Void {
        
        self.mainView.layer.shadowColor = UIColor.black.cgColor;
        self.mainView.layer.shadowOpacity = 0.6;
        self.mainView.layer.shadowRadius = 4.0;
        self.mainView.layer.shadowOffset = CGSize(width: 5.0, height: 5.0);
        
        let view_center : CGPoint = CGPoint(x: self.mainView.frame.size.width / 2, y: self.mainView.frame.size.height / 2);
        
        center_image.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
        center_image.isHidden = false;
        center_image.contentMode = .scaleAspectFit
        center_image.center = CGPoint(x: view_center.x, y: view_center.y - 20)
        self.mainView.addSubview(center_image);
        
        
        label.frame = CGRect(x: 0, y: 0, width: self.mainView.frame.size.width, height: 40);
        label.center = CGPoint(x: center_image.center.x, y: center_image.center.y + 60);
        label.textAlignment = .center;
        label.textColor = UIColor.white;
        label.font = UIFont.boldSystemFont(ofSize: 25);
        
        labelInitialPostion = label.frame;
        
        
        additional_image.frame = CGRect(x: 0, y: 0, width: 20, height: 10)
        additional_image.center = CGPoint(x: self.mainView.frame.size.width / 2, y: self.mainView.frame.size.height - 20);
        additional_image.alpha = 0;
        
        self.mainView.addSubview(additional_image);
        self.mainView.addSubview(label);
        
    }
    
    func showAllSection() -> Void {
        UIView.animate(withDuration: 0.5, animations: {
            self.label.alpha = 1.0;
            self.label.frame = self.labelInitialPostion!;
            self.center_image.alpha = 1.0;
        });
        self.additional_image.alpha = 0.0;
    }
    
    func hideImageAndRepositionLabel(frame : CGRect) -> Void {
        self.center_image.alpha = 0;
        UIView.animate(withDuration: 0.5, animations: {
            self.label.center = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2);
            self.additional_image.alpha = 1.0;
            self.additional_image.center = CGPoint(x: frame.size.width / 2, y: frame.size.height - 20);

        });
    }
    
    func hideImageAndLabel() -> Void {
        self.label.alpha = 0;
        self.center_image.alpha = 0;
        self.additional_image.alpha = 0;
    }
}

