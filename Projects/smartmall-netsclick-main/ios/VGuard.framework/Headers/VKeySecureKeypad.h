//
//  VKeySecureKeypad.h
//  VGuard
//
//  Created by Chinwee Koh on 30/12/13.
//  Copyright (c) 2013 V-Key Pte Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface VKeySecureKeypad : NSObject

@property (assign, nonatomic) id closeButtonTarget;
@property (assign, nonatomic) SEL closeButtonSelector;
@property (assign, nonatomic) UIControlEvents closeButtonControl;

+ (VKeySecureKeypad *)sharedModule;


#pragma mark - Number Keypad & Alphameric Keyboard

/**
 * Enable secure keyboard & keypad, default value is NO
 *
 * Discussion: enable the keyboard & keypad, default is disabled
 */
@property (assign, nonatomic) BOOL enableKeyboard;

/**
 * Number Keypad & Alphameric Keyboard background touch highlight colour
 *
 * Discussion: customize the highlight color of the button when tap, default is white glow effect
 */
@property (strong, nonatomic) UIColor *keyTouchHighlightColor;

/**
 * Number Keypad & Alphameric Keyboard CLOSE button selector event
 *
 * Discussion: add a selector to this button, setting the target for additional event setting the control event, upon trigger this button will always hide the keypad/keyboard
 */
- (void)setCustomCloseButton:(id)target selector:(SEL)selector control:(UIControlEvents)control;


#pragma mark - Custom Number Keypad

/**
 * Enable scrambling effect for keypad, default value is NO
 *
 * Discussion: enable scrambling effect for keypad button, default is disabled, securekypad must be enabled
 */
@property (assign, nonatomic) BOOL enableScrambleKeypad;

/**
 * Number Keypad button title color
 *
 * Discussion: customize the keypad button title color, default color is black
 */
@property (strong, nonatomic) UIColor *keypadTextColor;

/**
 * Number Keypad button image only
 *
 * Discussion: customize the keypad button background image
 */
@property (strong, nonatomic) UIImage *keypadButtonImage;

/**
 * Number Keypad button alpha
 *
 * Discussion: customize the keypad button alpha, default alpha is 1.0
 */
@property (assign, nonatomic) CGFloat keypadButtonAlpha;

/**
 * Number Keypad button background color
 *
 * Discussion: customize the keypad button background color, default color is gray
 */
@property (strong, nonatomic) UIColor *keypadButtonBackgroundColor;

/**
 * Number Keypad button "DELETE" font 
 *
 * Discussion: customize the keypad button font, default font for "DELETE "is systemFontOfSize of 16
 */
@property (strong, nonatomic) UIFont *keypadDeleteButtonFont;

/**
 * Number Keypad button "DELETE" title
 *
 * Discussion: customize the DELETE button title, default value is symbol
 */
@property (strong, nonatomic) NSString *keypadDeleteButtonText;

/**
 * Number Keypad button "CLOSE" font
 *
 * Discussion: customize the keypad button font, default font for "CLOSE "is systemFontOfSize of 16
 */
@property (strong, nonatomic) UIFont *keypadCloseButtonFont;

/**
 * Number Keypad button "CLOSE" title
 *
 * Discussion: customize the CLOSE button title, default value is 'CLOSE'
 */
@property (strong, nonatomic) NSString *keypadCloseButtonText;


#pragma mark - Custom Alphameric Keyboard Only

/**
 * Alphameric Keyboard button title color
 *
 * Discussion: customize the keyboard button title color, default color is white
 */
@property (strong, nonatomic) UIColor *keyboardTextColor;

/**
 * Alphameric Keyboard DEL button title
 *
 * Discussion: customize the DEL button title, default value is symbol
 */
@property (strong, nonatomic) NSString *keyboardDeleteButtonText;

/**
 * Alphameric Keyboard CLOSE button title
 *
 * Discussion: customize the CLOSE button title, default value is 'CLOSE'
 */
@property (strong, nonatomic) NSString *keyboardCloseButtonText;

/**
 * Alphameric Keyboard SHIFT button title
 *
 * Discussion: customize the SHIFT button title, default value is symbol
 */
@property (strong, nonatomic) NSString *keyboardShiftButtonText;

/**
 * Alphameric Keyboard button image only
 *
 * Discussion: customize the keyboard button background image
 */
@property (strong, nonatomic) UIImage *keyboardButtonImage;

/**
 * Alphameric Keyboard button background color
 *
 * Discussion: customize the Keyboard button background color, default color is gray
 */
@property (strong, nonatomic) UIColor *keyboardButtonBackgroundColor;

/**
 * Alphameric Keyboard button alpha
 *
 * Discussion: customize the keyboard button alpha, default alpha is 1.0
 */
@property (assign, nonatomic) CGFloat keyboardButtonAlpha;

/**
 * Alphameric Keyboard background color
 *
 * Discussion: customize the keyboard background color, default color is black
 */
@property (strong, nonatomic) UIColor *keyboardBackgroundColour;

@end
