//
//  ChooseAndResultViewController.h
//  MatchingAtParty
//
//  Created by Yuki Tomiyoshi on 2014/02/08.
//  Copyright (c) 2014年 Yuki Tomiyoshi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChooseAndResultView.h"

@interface ChooseAndResultViewController : UIViewController{
    CGRect rect;
    int selectingUserId;
    int selectingUserGender;
    int selectedUserId;
    NSMutableArray *couple;
    int displayingCoupleId;
//    int displayingMagnifyId;
}

@property (nonatomic, retain) UIScrollView *scrollView;
@property (nonatomic, retain) ChooseAndResultView *chooseAndResultView;

@end
