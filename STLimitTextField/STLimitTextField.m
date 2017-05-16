//
//  STLimitTextField.m
//  STLimitTextField
//
//  Created by Suta on 2017/4/28.
//  Copyright © 2017年 Suta. All rights reserved.
//

#import "STLimitTextField.h"

@implementation STLimitTextField {
    BOOL _limited;
}

- (void)dealloc {
    [self removeObservers];
}

#pragma mark - Private

- (void)limitText {
    if (_limit == 0 || self.text.length == 0) {
        return;
    }
    if (_limitType == STLimitLength) {
        NSString *newText = self.text;
        UITextRange *selectedRange = self.markedTextRange;
        UITextPosition *position = [self positionFromPosition:selectedRange.start offset:0];
        if (!position && newText.length > _limit) {
            NSRange selectedTextRange = [self getSelectedTextRange];
            self.text = [self substring:newText toIndexByWord:_limit];
            if (selectedTextRange.location + selectedTextRange.length <= self.text.length) {
                NSRange newSelectedTextRange = [self getSelectedTextRange];
                if (!NSEqualRanges(selectedTextRange, newSelectedTextRange)) {
                    [self updateSelectedTextRange:selectedTextRange];
                }
            }
        }
    } else if (_limitType == STLimitChar) {
        NSString *newText = self.text;
        UITextRange *selectedRange = self.markedTextRange;
        UITextPosition *position = [self positionFromPosition:selectedRange.start offset:0];
        NSUInteger newTextCharacterCount = [self stringCharacterCount:newText];
        if (!position && newTextCharacterCount > _limit) {
            NSRange selectedTextRange = [self getSelectedTextRange];
            for (NSInteger location = newText.length - 1; location >= 0; location--) {
                NSString *saveText = [self substring:newText toIndexByWord:location];
                if ([self stringCharacterCount:saveText] <= _limit) {
                    self.text = saveText;
                    if (selectedTextRange.location + selectedTextRange.length <= self.text.length) {
                        NSRange newSelectedTextRange = [self getSelectedTextRange];
                        if (!NSEqualRanges(selectedTextRange, newSelectedTextRange)) {
                            [self updateSelectedTextRange:selectedTextRange];
                        }
                    }
                    break;
                }
            }
        }
    }
}

- (NSUInteger)stringCharacterCount:(NSString *)string {
    NSUInteger characterCount = 0, stringLength = string.length;
    for (NSUInteger i = 0; i < stringLength; i++) {
        unichar c = [string characterAtIndex:i];
        if (c & 0xFF00) {
            characterCount += 2;
        } else {
            characterCount++;
        }
    }
    return characterCount;
}

- (NSString *)substring:(NSString *)string toIndexByWord:(NSUInteger)index {
    NSString *subString = nil;
    NSRange range = [string rangeOfComposedCharacterSequenceAtIndex:index];
    if (range.length == 1) {
        subString = [string substringToIndex:index];
    } else {
        NSUInteger length = range.length;
        range = [string rangeOfComposedCharacterSequencesForRange:NSMakeRange(0, index)];
        subString = [string substringWithRange:NSMakeRange(range.location, range.length - length)];
    }
    return subString;
}

- (NSRange)getSelectedTextRange {
    UITextPosition *beginning = self.beginningOfDocument;
    UITextRange *selectedTextRange = self.selectedTextRange;
    UITextPosition *selectedTextRangeStart = selectedTextRange.start;
    UITextPosition *selectedTextRangeEnd = selectedTextRange.end;
    NSInteger location = [self offsetFromPosition:beginning toPosition:selectedTextRangeStart];
    NSInteger length = [self offsetFromPosition:selectedTextRangeStart toPosition:selectedTextRangeEnd];
    return NSMakeRange(location, length);
}

- (void)updateSelectedTextRange:(NSRange)range {
    UITextPosition *beginning = self.beginningOfDocument;
    UITextPosition *startPosition = [self positionFromPosition:beginning offset:range.location];
    UITextPosition *endPosition = [self positionFromPosition:beginning offset:range.location + range.length];
    UITextRange *selectedTextRange = [self textRangeFromPosition:startPosition toPosition:endPosition];
    self.selectedTextRange = selectedTextRange;
}

#pragma mark - getter & setter

- (void)setLimit:(NSUInteger)limit {
    _limit = limit;
    if (_limit == 0) {
        [self removeObservers];
    } else {
        [self addObservers];
        [self limitText];
    }
}

- (void)setLimitType:(STLimitType)limitType {
    _limitType = limitType;
    [self limitText];
}

#pragma mark - Observe

- (void)addObservers {
    if (!_limited) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleTextDidChangeNotification:) name:UITextFieldTextDidChangeNotification object:self];
        _limited = YES;
    }
}

- (void)removeObservers {
    if (_limited) {
        [[NSNotificationCenter defaultCenter] removeObserver:self];
        _limited = NO;
    }
}

- (void)handleTextDidChangeNotification:(NSNotification *)sender {
    [self limitText];
}

@end
