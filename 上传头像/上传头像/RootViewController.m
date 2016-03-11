//
//  RootViewController.m
//  上传头像
//
//  Created by 栾金鑫 on 15/12/22.
//  Copyright © 2015年 栾金鑫. All rights reserved.
//

#import "RootViewController.h"
#import "UIView+Extension.h"
#import "Masonry.h"
#define ICONW 100; // 头像宽度

@interface RootViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (strong , nonatomic) UIImageView * iconImageView;
@property (strong , nonatomic) UIButton * iconImageButton;
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setImageView];
}
- (UIImageView *)iconImageView {
    if (!_iconImageView) {
        _iconImageView = UIImageView.new;
        _iconImageView.image =  [UIImage imageNamed:@"icon_userAvatar_default"];
        _iconImageView.userInteractionEnabled = YES;
        _iconImageView.contentMode = UIViewContentModeScaleAspectFill;
        _iconImageView.width = ICONW;
        _iconImageView.height = ICONW;
        _iconImageView.layer.cornerRadius = _iconImageView.width * 0.5;
        _iconImageView.layer.masksToBounds = YES;
    }
    return _iconImageView;
}
-(UIButton *)iconImageButton{
    if (!_iconImageButton) {
        _iconImageButton = UIButton.new;
        _iconImageButton.backgroundColor = [UIColor clearColor];
        _iconImageButton.contentMode = UIViewContentModeScaleAspectFill;
        _iconImageButton.width = ICONW;
        _iconImageButton.height = ICONW;
        _iconImageButton.layer.cornerRadius = _iconImageButton.width * 0.5;
        _iconImageButton.layer.masksToBounds = YES;
        [_iconImageButton addTarget:self action:@selector(changeIconImage:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _iconImageButton;
}
-(void)setImageView{
    [self.view addSubview:self.iconImageView];
    [self.view addSubview:self.iconImageButton];

    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(@100);
        make.width.height.equalTo(@100);
    }];

    [self.iconImageButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(@100);
        make.width.height.equalTo(@100);
    }];
}
-(void)changeIconImage:(UIButton *)sender{
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc]init];
    imagePicker.delegate = self;
    // 允许编辑
    imagePicker.allowsEditing = YES;
    [imagePicker setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    [self presentViewController:imagePicker animated:YES completion:nil];
}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    //    返回一个编辑后的图片 UIImagePickerControllerOriginalImage
    UIImage *selectedImage = info[@"UIImagePickerControllerEditedImage"];
    self.iconImageView.image = selectedImage;
    [picker dismissViewControllerAnimated:YES completion:nil];
}

@end
