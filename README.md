This project is only for study purpose. Please don't use it for other commerical purpose.

This project is to illustrate the functionality of AutoLayout in dealing with very long string.

Background. Autolayout use Cassowary solver to solve a set of Linear equation such as Y = A*X + B. (All variables are in Matrix format). Comparing to the no-autolayout, the system had to solve this Linear equation to determine the frame of view. As you could imagine
In my test case. I have a bar with 3 labels. Left, Title and Right Label. Each Label has a long string. In the  old way by using layoutSubview to position the label, it would be very difficult to do so and sometimes, it would cause the label overlap each other.

However, using autolayout would solve this problem. e
