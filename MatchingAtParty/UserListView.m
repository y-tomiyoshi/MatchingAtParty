//
//  UserListView.m
//  MatchingAtParty
//
//  Created by Yuki Tomiyoshi on 2014/01/29.
//  Copyright (c) 2014年 Yuki Tomiyoshi. All rights reserved.
//

#import "UserListView.h"

const int buttonRate = 10;

@implementation UserListView

- (UIButton*)plusMaleUserButton {
    if(!_plusMaleUserButton) {
        _plusMaleUserButton = [[UIButton alloc] initWithFrame:CGRectMake((width - (width / buttonRate * 2)) / 8,
                                                                         [[UIScreen mainScreen] bounds].size.height - [[UIScreen mainScreen] applicationFrame].size.height + 10,
                                                                         width / buttonRate,
                                                                         width / buttonRate)];
        UIImage *img = [UIImage imageNamed:@"plusMaleUser.png"];
        [_plusMaleUserButton setBackgroundImage:img forState:UIControlStateNormal];
        _plusMaleUserButton.layer.cornerRadius = 10.0f;
        _plusMaleUserButton.clipsToBounds = YES;
        [self addSubview:_plusMaleUserButton];
    }
    return _plusMaleUserButton;
}

- (UIButton*)plusFemaleUserButton {
    if(!_plusFemaleUserButton) {
        _plusFemaleUserButton = [[UIButton alloc] initWithFrame:CGRectMake((width - (width / buttonRate * 2)) / 8 * 7 + width / buttonRate,
                                                                           [[UIScreen mainScreen] bounds].size.height - [[UIScreen mainScreen] applicationFrame].size.height + 10,
                                                                           width / buttonRate,
                                                                           width / buttonRate)];
        UIImage *img = [UIImage imageNamed:@"plusFemaleUser.png"];
        [_plusFemaleUserButton setBackgroundImage:img forState:UIControlStateNormal];
        _plusFemaleUserButton.layer.cornerRadius = 10.0f;
        _plusFemaleUserButton.clipsToBounds = YES;
        [self addSubview:_plusFemaleUserButton];
    }
    return _plusFemaleUserButton;
}

- (UIButton*)startMatchingButton {
    if(!_startMatchingButton) {
        _startMatchingButton = [[UIButton alloc] initWithFrame:CGRectMake(0,
                                                                          [[UIScreen mainScreen] bounds].size.height - [[UIScreen mainScreen] applicationFrame].size.height + 10,
                                                                          width / buttonRate * 3,
                                                                          width / buttonRate)];
        _startMatchingButton.center = CGPointMake([[UIScreen mainScreen] bounds].size.width / 2,
                                                  _startMatchingButton.center.y);
        [_startMatchingButton setTitle:@"start" forState:UIControlStateNormal];
        _startMatchingButton.backgroundColor = [UIColor redColor];
        [self addSubview:_startMatchingButton];
    }
    return _startMatchingButton;
}

- (UIView*) userView {
    UIView *userView = [[UIView alloc]initWithFrame:CGRectMake(0,
                                                        0,
                                                        width / 2,
                                                        height / 5)];
    return userView;
}

- (UIImageView*)userIcon {
    UIImageView *userIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"noIconUser.png"]];
    userIcon.layer.cornerRadius = 10.0f;
    userIcon.clipsToBounds = YES;
    userIcon.userInteractionEnabled = YES;
    return userIcon;
}

- (UIImageView*)userGenderIcon {
    UIImageView *userGenderIcon = [[UIImageView alloc] init];
    userGenderIcon.layer.cornerRadius = 5.0f;
    userGenderIcon.clipsToBounds = YES;
    return userGenderIcon;
}

- (UITextField*)userName {
    UITextField *userName = [[UITextField alloc] init];
    userName.placeholder = @"User Name";
    return userName;
}

- (UIButton*)deleteUserButton {
    UIButton *deleteUserButton = [[UIButton alloc] init];
    UIImage *img = [UIImage imageNamed:@"deleteUser.png"];
    [deleteUserButton setBackgroundImage:img forState:UIControlStateNormal];
    return deleteUserButton;
}

- (void)layoutUserView:(int)gender UserId:(int)userId columnNum:(int)columnNum {
    UIView *userView = [self userView];
    userView.tag = userId;
    if(gender == 0) {
        userView.frame = CGRectMake(0,
                                    userView.frame.size.height * (columnNum - 1),
                                    userView.frame.size.width,
                                    userView.frame.size.height);
    }else if(gender == 1) {
        userView.frame = CGRectMake(width / 2,
                                    userView.frame.size.height * (columnNum - 1),
                                    userView.frame.size.width,
                                    userView.frame.size.height);
    }
    
    UIImageView *userIcon = [self userIcon];
    userIcon.frame = CGRectMake(0,
                                0,
                                userView.frame.size.height / 5 * 4,
                                userView.frame.size.height / 5 * 4);
    [userView addSubview:userIcon];
    
    UIImageView *userGenderIcon = [self userGenderIcon];
    userGenderIcon.frame = CGRectMake(userIcon.frame.origin.x,
                                      userIcon.frame.origin.y + userIcon.frame.size.height,
                                      userView.frame.size.height - userIcon.frame.size.height,
                                      userView.frame.size.height - userIcon.frame.size.height);
    if(gender == 0) {
        userGenderIcon.image = [UIImage imageNamed:@"male.png"];
    }else if(gender == 1) {
        userGenderIcon.image = [UIImage imageNamed:@"female.png"];
    }
    [userView addSubview:userGenderIcon];
    
    UITextField *userName = [self userName];
    userName.frame = CGRectMake(userGenderIcon.frame.origin.x + userGenderIcon.frame.size.width,
                                userGenderIcon.frame.origin.y,
                                userView.frame.size.width - userGenderIcon.frame.size.height,
                                userGenderIcon.frame.size.height);
    [userView addSubview:userName];
    
    UIButton *deleteUserButton = [self deleteUserButton];
    deleteUserButton.frame = CGRectMake(userView.frame.size.width - userIcon.frame.size.height / 4 - 10,
                                        userIcon.frame.origin.y,
                                        userIcon.frame.size.height / 4,
                                        userIcon.frame.size.height / 4);
    [userView addSubview:deleteUserButton];
    
    [self addSubview:userView];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        width = [[UIScreen mainScreen] bounds].size.width;
        height = [[UIScreen mainScreen] bounds].size.height;
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
