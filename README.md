# AXTabWithAnimation

The AXTabWithAnimation is a demo demonstrates how to make a custom container view controller.

![alt tag](https://github.com/naverdant/AXTabWithAnimation/blob/master/1499938019860.jpg)

## Reference
[Apple Developer Official Guide](https://developer.apple.com/library/content/featuredarticles/ViewControllerPGforiPhoneOS/ImplementingaContainerViewController.html)

[Cocoacasts Plus](https://cocoacasts.com/managing-view-controllers-with-container-view-controllers)

> ## Adding a Child View Controller to Your Content
> 1. Call the `addChildViewController:` method of your container view controller.
> 2. Add the child's root view to your container's view hierachy.
> 3. Call the `didMoveToParentViewController:` method of the child view controller.
>
> ## Removing a Child View Controller
> 1. Call the child's `willMoveToParentViewController:` method with the value nil.
> 2. Remove the child's root view from your container's view hierachy.
> 3. Call the child's `removeFromParentViewController` method to finalize the end of the parent-child relationship.
>
> ## Transitioning Between Child View Controllers
> Call the `transionFromViewController:toViewController:duration:options:animations:completions:` method and it automatically > updates the container's view hierachy, so you don't need t add and remove the views yourself.
>
> ## Suggestions fo Building a Container View Controller
> 1. Access only the root view o a child view controller.
> 2. Child view controllers should have minimal knowledge of their container. Use the delegation design patter t manage those interactions.

