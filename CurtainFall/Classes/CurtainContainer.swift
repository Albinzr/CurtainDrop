//
//  CurtainContainer.swift
//  Pods
//
//  Created by Moin on 26/01/17.
//
//

import UIKit

public class CurtainContainer: NSObject {

    public var list : [CurtainStr] = [CurtainStr]();
    var viewList : [UIView] = [UIView]();
    var frameArray : [CGRect] = [CGRect]();
    var individualViewWidth : CGFloat = CGFloat(0);
    var individualViewHeight : CGFloat = CGFloat(0);
    public let mainView : UIView = UIView();
    var listOfCells : [Curtain] = [Curtain]();
    var topBarState : currentState = .expanded;
    
    var selectionFrame : CGRect? = nil;

    public var delegate : CurtainDelegate? = nil;
    
    public override init() {
        super.init();
    }
    
    public func loadFrameAndData(frame : CGRect,listToAdd : [CurtainStr]){
        self.mainView.frame = frame
        
        self.selectionFrame = CGRect(x: 0, y: 0, width: frame.size.width, height: 90);
        
        self.list.removeAll();
        for item in listToAdd{
            self.list.append(item)
        }
        
        individualViewWidth = frame.size.width;
        individualViewHeight = frame.size.height / CGFloat(list.count)
        
        var current_Y : CGFloat = 0;
        self.frameArray.removeAll();
        self.viewList.removeAll();
        for i in 0..<self.list.count{
            let myStr : CurtainStr = self.list[i];
            let current : Curtain = Curtain();
            current.loadFrame(frame: CGRect(x: 0, y: current_Y, width: individualViewWidth, height: individualViewHeight))
            current.myData = myStr;
            current.mainView.tag = i;
            self.frameArray.append(current.mainView.frame);
            self.viewList.append(current.mainView);
            current_Y = current_Y + individualViewHeight;
            listOfCells.append(current);
        }
        loadUI();
    }
    
    
    func loadUI() -> Void {
        var tempList : [UIView] = [UIView]();
        tempList.removeAll();
        for item in self.viewList {
            tempList.append(item);
        }
        tempList.reverse();
        
        for item in tempList{
            let tap = UITapGestureRecognizer(target: self, action: #selector(tappedMe(sender:)))
            item.isUserInteractionEnabled = true
            item.addGestureRecognizer(tap)
            self.mainView.addSubview(item);
        }
    }
    
    func tappedMe(sender: UITapGestureRecognizer) {
        var index : Int! = (sender.view?.tag)! as Int;
        delegate?.curtainSelctedAtIndex(index: index);
        if topBarState == .expanded{
            topBarState = .contracted;
            for i in 0..<self.viewList.count{
                if index != i{
                    self.listOfCells[i].hideImageAndLabel();
                    UIView.animate(withDuration: 0.5, animations: {
                        self.viewList[i].frame = CGRect(x: 0, y: 0, width: self.individualViewWidth, height: 0)
                    });
                }else{
                    self.listOfCells[i].hideImageAndRepositionLabel(frame: self.selectionFrame!);
                    UIView.animate(withDuration: 0.5, animations: {
                        self.viewList[i].frame = self.selectionFrame!;
                    });
                }
            }
        }else{
            topBarState = .expanded;
            for i in 0..<self.viewList.count{
                self.listOfCells[i].showAllSection();
                UIView.animate(withDuration: 0.5, animations: {
                    self.viewList[i].frame = self.frameArray[i];
                });
            }
        }
    }
}

enum currentState {
    case expanded,contracted;
}

public class CurtainStr: NSObject {
    public var downArrowImage : UIImage? = nil;
    public var my_index : Int = 0;
    public var title : String = "";
    public var image : UIImage? = nil;
    public var backgroundColor : UIColor = UIColor.white;
}

public protocol CurtainDelegate {
    func curtainSelctedAtIndex(index : Int);
}
