//
//  IDZConverterViewController.m
//  Temperature Converter
//
//  Created by Anthony Powles on 15/01/14.
//  Copyright (c) 2014 Anthony Powles. All rights reserved.
//

#import "IDZConverterViewController.h"

@interface IDZConverterViewController ()

@property (weak, nonatomic) IBOutlet UITextField *fahrenheitText;
@property (weak, nonatomic) IBOutlet UITextField *celsiusText;
@property (weak, nonatomic) IBOutlet UIView *fahrenheitBox;
@property (weak, nonatomic) IBOutlet UIView *celsiusBox;

@property int currentTextTag;

- (IBAction)onTap:(id)sender;
- (IBAction)onEditBegin:(id)sender;
- (void)updateBackgrounds:(UIView *)selectedTextField deselect:(UIView *)oldTextField;
- (void)setup;

enum {
	FahrenheitTag = 1,
	CelsiusTag
};

@end

@implementation IDZConverterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
	self = [super initWithCoder:aDecoder];
    if (self) {
    }
    return self;
}

- (void)setup
{
	self.fahrenheitText.tag = FahrenheitTag;
	self.celsiusText.tag = CelsiusTag;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
	[self setup];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onEditBegin:(UITextField *)sender {
	self.currentTextTag = sender.tag;

	if (sender == self.fahrenheitText) {
		[self updateBackgrounds:self.fahrenheitBox deselect:self.celsiusBox];
	}
	else if (sender == self.celsiusText) {
		[self updateBackgrounds:self.celsiusBox deselect:self.fahrenheitBox];
	}
}

- (IBAction)onTap:(id)sender {
	NSLog(@"tap! %d", self.currentTextTag);

	if (self.currentTextTag == FahrenheitTag) {
		float fahrenheitValue = [self.fahrenheitText.text floatValue];
		float celsiusValue = (fahrenheitValue - 32) / 1.8;
		
		self.celsiusText.text = [NSString stringWithFormat:@"%.1f", celsiusValue];
	}
	else if (self.currentTextTag == CelsiusTag) {
		float celsiusValue = [self.celsiusText.text floatValue];
		float fahrenheitValue = celsiusValue * 1.8 + 32;
		
		self.fahrenheitText.text = [NSString stringWithFormat:@"%.1f", fahrenheitValue];
	}
}

- (void)updateBackgrounds:(UIView *)selectedTextField deselect:(UIView *)oldTextField {
	[selectedTextField setBackgroundColor:[UIColor greenColor]];
	[oldTextField setBackgroundColor:[UIColor whiteColor]];
}
@end
