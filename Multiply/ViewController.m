//
//  ViewController.m
//  Multiply
//
//  Created by Matt Larkin on 3/26/15.
//  Copyright (c) 2015 Matt Larkin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIAlertViewDelegate>
@property (strong, nonatomic) IBOutlet UITextField *numberTextField;
@property (strong, nonatomic) IBOutlet UILabel *multiplierLabel;
@property (strong, nonatomic) IBOutlet UILabel *answerLabel;
@property (strong, nonatomic) IBOutlet UISlider *multiplySlider;
@property (strong, nonatomic) IBOutlet UISlider *slideTool;
@property (strong, nonatomic) IBOutlet UISegmentedControl *operatorsegmentControl;


@property int sliderNumber;
@property int enteredNumber;
@property int multiplier;
@property int results;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];




}

- (IBAction)onSliderValueChanged:(UISlider *)sender {
    self.sliderNumber = (int)self.slideTool.value;
    self.multiplierLabel.text = [NSString stringWithFormat:@"%i", self.sliderNumber];




}

- (IBAction)onCalculateButtonPressed:(UIButton *)sender {

    /**
     *  Convert user input into Integers
     */
    self.enteredNumber = [self.numberTextField.text intValue];
    self.multiplier = [self.multiplierLabel.text intValue];
    self.results = [self.answerLabel.text intValue];


   // self.results = self.enteredNumber * self.multiplier;
    


    /**
     *  Changes operator based on segemented control Index Positon
     */

    if (self.operatorsegmentControl.selectedSegmentIndex == 0)
    {
        self.results = self.multiplier * self.enteredNumber;

    }
    else if (self.operatorsegmentControl.selectedSegmentIndex == 1)
    {
        self.results = (self.multiplier / self.enteredNumber);
        NSLog(@"%i", self.results);
    }

    /**
     *  Converts results variable to the answerlabel string
     */
    self.answerLabel.text = [NSString stringWithFormat:@"%i", self.results];



    /**
     *  Changes view-controller background color if result is greater than 20.
     */

    if (self.results >= 20)
    {

        self.view.backgroundColor = [UIColor greenColor];

    }
    else {
        self.view.backgroundColor = [UIColor whiteColor];
    }


    /**
     *  Produces Fizz Buzz based on if results are multiples of 3 or 5
     */

    if (self.results %3 == 0 && self.results %5 == 0) {
        self.answerLabel.text = @"fizz buzz";
    }

    else if (self.results %3 == 0){
        self.answerLabel.text = @"fizz";
    }

    else if (self.results %5 == 0) {
        self.answerLabel.text = @"buzz";
    }


    /**
     *  Displays an alert prompting user to change input, if less than zero.
     */
    if (self.results <= 0) {

        UIAlertView *alert = [UIAlertView new];
        alert.delegate = self;
        alert.title = @"Error!";
        alert.message = @"Please ensure your answer is greater than 0";
        [alert addButtonWithTitle:@"Dismiss"];
        [alert show];

    }

}



@end
