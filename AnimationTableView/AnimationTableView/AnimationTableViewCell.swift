//
//  AnimationTableViewCell.swift
//  AnimationTableView
//
//  Created by Hiem Seyha on 6/4/18.
//  Copyright © 2018 Hiem Seyha. All rights reserved.
//

import UIKit




class AnimationTableViewCell: UITableViewCell {
   
   @IBOutlet weak var topConstantTitle: NSLayoutConstraint!
   @IBOutlet weak var arrowKeyImageView: UIImageView!
   @IBOutlet weak var subtitleLabel: UILabel!
   @IBOutlet weak var titleLabel: UILabel!
   @IBOutlet weak var TopArrowConstant: NSLayoutConstraint!
   
   @IBOutlet weak var heightConstant: NSLayoutConstraint!
   
   enum Constant: CGFloat {
      case constantAnimation = 20.0
      case constantAnimationArrow = 18.0
      case constantAnimationTitle = 10.0
   }
   
   

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

      if selected == true {
         animationToggle()
      }
     
    }
   
   
   func animationToggle() {
      
      if self.heightConstant.constant != Constant.constantAnimation.rawValue {
         
         self.heightConstant.constant = Constant.constantAnimation.rawValue
         self.TopArrowConstant.constant += Constant.constantAnimationArrow.rawValue
         self.topConstantTitle.constant -= Constant.constantAnimationTitle.rawValue
         
         UIView.animationLayout(viewAnimation: self)
         
      } else {
         
         self.heightConstant.constant = 0
         self.TopArrowConstant.constant -= Constant.constantAnimationArrow.rawValue
         self.topConstantTitle.constant += Constant.constantAnimationTitle.rawValue
         
         UIView.animationLayout(viewAnimation: self)
         
      }
      
   }

 
   static func registerNib() -> UINib {
      return UINib(nibName: "AnimationTableViewCell", bundle: nil)
   }
   
   static var cellID : String {
      return "cell"
   }
    
}


fileprivate extension UIView {
   static func animationLayout(viewAnimation: UIView,
                               withDuration:TimeInterval = 0.5,
                               delay: TimeInterval = 0,
                               usingSpringWithDamping: CGFloat = 2,
                               initialSpringVelocity: CGFloat = 2,
                               options: UIViewAnimationOptions = [.curveEaseIn]) {
      
      self.animate(withDuration: withDuration, delay: delay, usingSpringWithDamping: usingSpringWithDamping, initialSpringVelocity: initialSpringVelocity, options: options, animations: {
         
         viewAnimation.layoutIfNeeded()
         
      } , completion: nil)
      
   }
}
