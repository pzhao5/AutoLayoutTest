This project is ONLY for study purpose.

This project is to illustrate the functionality of AutoLayout in dealing with views that have very long string.

Background:

Autolayout uses Cassowary solver to solve a set of Linear equation such as Y = A*X + B. (All variables are in Matrix format). Comparing to the no-Autolayout, Autolayout system had to solve this Linear equation to determine the views’ frame. As you could imagine, it would take times for system come up with a flexiable solution (The time and number of equations are no-linear). Similar to no-Autolayout, Autolayout System also call layoutSubview and drawRect: in order. However, it would call updateConstraint before layoutSubview. If you need an additional layout of view, layoutSubview would allow you to re-position the subviews again disregard of the constraints.

In this example:

In my test case. I have a view with 3 labels: Left, Title and Right. Each Label has a string (could be long). Before using autolayout, I implement a standard layout for those labels. Left is 8px from left edge of superview. Right is 8px from right edge of superview and Title is in the middle of superview. When the string gets super longer, those labels begin to overlap with each other. Although putting more work in the layoutSubview might solve this issue, autolayout seems to be a better solution. I define that relation between those views rather their actually frame (Autolayout solves view’s frame). One thing needs to be pointed out, I also override the layoutSubview in the PZAutoLayoutView. Because I want to have labels are vertically middle position  between top and bottom views and there is not a way to express such constraint in Autolayout. As a result, I override the layoutSubview and make sure to position the labels.

In Summary:

I am not a big fan of Autolayout. I spent quite some time to make it work and I believe that I could write a very sophistic layoutSubview method to deal with long string. However, Autolayout makes code look simpler and easy to spot a bug.

Best Practice:

Test the view separately from your main App. If you test your view along with the main App. It is very hard to figure out the layout issue. The best way to do so is to write a good unit test on it.
Test on long long string if you care about international market. Provide a set of test string and see how the view handle such string (which string should be truncated or omit).

![alt tag](https://github.com/pzhao5/AutoLayoutTest/blob/master/screenshot.png)