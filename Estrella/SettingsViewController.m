//
// SettingsViewController.m
//
// Copyright (C) 2019 Antony Chazapis SV9OAN
//
// This program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public License
// as published by the Free Software Foundation; either version 2
// of the License, or (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software
// Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

#import "SettingsViewController.h"

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.userCallsignTextField.delegate = self;
    self.reflectorCallsignTextField.delegate = self;
    self.reflectorModuleTextField.delegate = self;
    
    [self.delegate fillInSettingsViewController:self];
}

- (IBAction)applyPressed:(id)sender {
    [self.delegate applyChangesFromSettingsViewController:self];
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)cancelPressed:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

# pragma mark UITextFieldDelegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (textField == self.userCallsignTextField || textField == self.reflectorCallsignTextField) {
        if (range.location > 6 || range.length > 7)
            return NO;
        if (string.length > 7)
            return NO;
        if (string.length > 0) {
            unichar c;
            for (int i = 0; i < string.length; i++) {
                c = [string characterAtIndex:i];
                if (!((c >= '0' && c <= '9') || (c >= 'A' && c <= 'Z')))
                    return NO;
            }
        }
    } else if (textField == self.reflectorModuleTextField) {
        if (range.location > 0 || range.length > 1)
            return NO;
        if (string.length > 1)
            return NO;
        if (string.length > 0) {
            unichar c = [string characterAtIndex:0];
            if (!(c >= 'A' && c <= 'Z'))
                return NO;
        }
    }
    
    return YES;
}

@end
