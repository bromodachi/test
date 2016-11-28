//: Playground - noun: a place where people can play

import XCPlayground
import UIKit


class ViewController : UIViewController {
    var button: UIButton!
    var anotherView: UIView!
    var verticalLayout : NSLayoutConstraint!

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        button = UIButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        print("Come here so man y times")
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.black, for: .normal)
        button.setTitle("Click Me to animate a dropdown", for: .normal)
        button.addTarget(self, action: #selector(ViewController.showView(_:)), for: .touchDown)
        
        anotherView = UIView()
        anotherView.translatesAutoresizingMaskIntoConstraints = false
        anotherView.backgroundColor = UIColor.red
        view.addSubview(anotherView)
        view.addSubview(button)
        view.backgroundColor = UIColor.white
        
        var constraints = [NSLayoutConstraint]()
        
        constraints.append(NSLayoutConstraint(item: button, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1.0, constant: 0))
        constraints.append(NSLayoutConstraint(item: button, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1.0, constant: 0))
        constraints.append(NSLayoutConstraint(item: button, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 50))
        constraints.append(NSLayoutConstraint(item: button, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 1.0, constant: 0))
        constraints.append(NSLayoutConstraint(item: anotherView, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 0.5, constant: 0))
        verticalLayout = NSLayoutConstraint(item: anotherView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 100)
        verticalLayout.constant = 0
        constraints.append(verticalLayout)
        constraints.append(NSLayoutConstraint(item: anotherView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 0))
        constraints.append(NSLayoutConstraint(item: anotherView, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1.0, constant: 0))
        

        
        NSLayoutConstraint.activate(constraints)
        
        
        
    }
    
    func showView(_ sender:  UIButton) {
        verticalLayout.constant = verticalLayout.constant == 0 ? 100 : 0
        UIView.animate(withDuration: 0.5, animations: {
            self.view.layoutIfNeeded()
        })
    }
}

let controller = ViewController(nibName: nil, bundle: nil)
controller.view.frame = CGRect(x: 0, y: 0, width: 320, height: 420)
XCPlaygroundPage.currentPage.liveView = controller.view
