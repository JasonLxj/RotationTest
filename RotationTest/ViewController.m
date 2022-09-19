//
//  ViewController.m
//

#import "ViewController.h"
#import <LEEAlert.h>

@interface ViewController ()

@property (nonatomic, assign) UIInterfaceOrientationMask mask;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mask = UIInterfaceOrientationMaskPortrait;
}

- (IBAction)onLandscapeClick:(id)sender {
    UIWindowScene *scene = (UIWindowScene *)[[[UIApplication sharedApplication] connectedScenes] anyObject];
    if (scene) {
        self.mask = UIInterfaceOrientationMaskLandscapeRight;
        UIWindowSceneGeometryPreferencesIOS *geometryPreferences = [[UIWindowSceneGeometryPreferencesIOS alloc] initWithInterfaceOrientations:self.mask];
        [scene requestGeometryUpdateWithPreferences:geometryPreferences
                                       errorHandler:^(NSError * _Nonnull error) {
            NSLog(@"%@", error.localizedDescription);
        }];
    }
    [self setNeedsUpdateOfSupportedInterfaceOrientations];
}

- (IBAction)onPortraitClick:(id)sender {
    UIWindowScene *scene = (UIWindowScene *)[[[UIApplication sharedApplication] connectedScenes] anyObject];
    if (scene) {
        self.mask = UIInterfaceOrientationMaskPortrait;
        UIWindowSceneGeometryPreferencesIOS *geometryPreferences = [[UIWindowSceneGeometryPreferencesIOS alloc] initWithInterfaceOrientations:self.mask];
        [scene requestGeometryUpdateWithPreferences:geometryPreferences
                                       errorHandler:^(NSError * _Nonnull error) {
            NSLog(@"%@", error.localizedDescription);
        }];
    }
    [self setNeedsUpdateOfSupportedInterfaceOrientations];
}

- (IBAction)onShowWindow:(id)sender {
    LEEAlert.alert.config.LeeAddTitle(^(UILabel * _Nonnull label) {
        label.text = @"测试文字";
    })
    .LeeAddAction(^(LEEAction *action) {
        action.type = LEEActionTypeDefault;
        action.title = @"Default";
        action.clickBlock = ^{
            NSLog(@"%@", @"点击了 Default");
        };
    })
    .LeeAddAction(^(LEEAction *action) {
        action.type = LEEActionTypeCancel;
        action.title = @"Cancel";
        action.clickBlock = ^{
            NSLog(@"%@", @"点击了 Cancel");
        };
    })
    .LeeShow();
}


- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    NSLog(@"%@", NSStringFromCGSize(size));
}

@end
