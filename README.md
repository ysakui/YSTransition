YSTransition
============

Custom UIViewController &amp; UINavigationController with transition from Right, Left, Top, Bottom

## YSViewController
Customized presentViewController from Right, from Left, from Top, from Bottom

![YSViewController](http://s13.postimg.org/wm2cdqqon/push_image.png)


## YSNavigationController
Customized pushViewController from Right, from Left, from Top, from Bottom

![YSNavigationController](http://s21.postimg.org/d1e8yzson/present_image.png)

## Installation

* Drag the `YSTransition/YSTransition` folder into your project.
* Add #include "YSViewController.h" or "YSNavigationController.h" to your need file

## Usage of YSViewController

inherited the YSViewController in your viewcontroller

```
#import "YSViewController.h"

@interface YourViewController : YSViewController
```

call `presentViewController:withTransitionType:completion:` method if presenting your viewController.

```
[self presentViewController:yourViewController withTransitionType:YSTransitionTypeFromRight completion:nil];
```

call `dismissViewControllerWithTransitionType:completion:` method if dismissing your viewController.

```
[self dismissViewControllerWithTransitionType:YSTransitionTypeFromLeft completion:nil];
```


## Usage of YSNavigationController

create a YSNavigationController

```
#import "YSNavigationController.h"

UIViewController *viewController = [[UIViewController alloc] init];
YSNavigationController *navigationController = [[YSNavigationController alloc] initWithRootViewController:viewController];
```

call `pushViewController:withTransitionType:` method if pushing your viewController.

```
[(YSNavigationController *)self.navigationController pushViewController:yourViewController withTransitionType:YSTransitionTypeFromLeft];
```

call `popViewControllerWithTransitionType:` method if return your viewController.

```
[(YSNavigationController *)self.navigationController popViewControllerWithTransitionType:YSTransitionTypeFromRight];
```

## License

YSTransition published under the MIT license:

Copyright (C) 2013, Yoshimitsu Sakui

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.





