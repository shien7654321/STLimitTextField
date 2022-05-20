# STLimitTextField

[![Language](https://img.shields.io/badge/language-ObjC-limegreen.svg?style=flat)](http://cocoapods.org/pods/STLimitTextField)
[![Platform](https://img.shields.io/cocoapods/p/STLimitTextField.svg?style=flat)](http://cocoapods.org/pods/STLimitTextField)
[![Version](https://img.shields.io/cocoapods/v/STLimitTextField.svg?style=flat)](http://cocoapods.org/pods/STLimitTextField)
[![License](https://img.shields.io/cocoapods/l/STLimitTextField.svg?style=flat)](http://cocoapods.org/pods/STLimitTextField)

## A textfield that can limit the length of the text.
STLimitTextField is a textfield that can limit the length of the text. You can limit the length of the text or the length of the character.

![STLimitTextFieldPreview01](https://github.com/shien7654321/STLimitTextField/raw/master/Preview/STLimitTextFieldPreview01.gif)

## Requirements

- iOS 8.0 or later (For iOS 8.0 before, maybe it can work, but I have not tested.)
- ARC

## Installation

STLimitTextField is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'STLimitTextField'
```

## Usage

### Import headers in your source files

In the source files where you need to use the library, import the header file:

```objective-c
#import <STLimitTextField/STLimitTextField.h>
```

### Initialize STLimitTextField

STLimitTextField is a subclass of UITextFiled. You can initialize it like UITextField, of course you can also use storyboard:

```objective-c
STLimitTextField *textFiled = [[STLimitTextField alloc] init];
```

### Configure STLimitTextFiled

STLimitTextFiled has two ways to limit the length of the text. You can use `STLimitLength` to limit the length of the text, or use `STLimitChar` to limit the length of the text characters:

```objective-c
textFiled.limitType = STLimitLength;
```

STLimitTextFiled can set the limit length with code or storyboard:

```objective-c
textFiled.limit = 5;
```

![STLimitTextFieldPreview02](https://github.com/shien7654321/STLimitTextField/raw/master/Preview/STLimitTextFieldPreview02.png)

## Author

Suta, shien7654321@163.com


## License

[MIT]: https://opensource.org/licenses/MIT
[MIT license][MIT].
