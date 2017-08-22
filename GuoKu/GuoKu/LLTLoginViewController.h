//
//  LLTLoginViewController.h
//  GuoKu
//
//  Created by mac on 15-11-9.
//  Copyright (c) 2015年 llt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LLTLoginViewController : UIViewController

{
    
    __weak IBOutlet UITextField *_emailTextField;
    __weak IBOutlet UITextField *_pswTextField;
    
    __weak IBOutlet UIButton *_loginBtn;
}

@property (weak,nonatomic)UIViewController *superVC;
@end
