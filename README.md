# First Swift/XCode Project

Learned the basics of Swift awhile ago. Now it's my turn to make a project... but first a tutorial. I've added on a bunch of stuff and fixed some weird things from it, too, such as the TabBar only showing the title for one tab.

This project includes (from tutorial and my own add-ons):

- TabBar (bottom navigation since coming from Android) [Tutorial]
- DetailView that leads to more detail views (rather than stopping at one) [Add-on]
- DetailView doesn't show TabBar [Add-on]
- Side spinner that disables Parchment Paging (for personal project)
- Infinite scrolling WITHOUT NEED for spinner (includes one just in case)

The tutorials I used are found here:
- (I specifically found one without Storyboard): https://www.youtube.com/watch?v=r696qMJidWI
- Infinite scrolling: https://www.youtube.com/watch?v=OTHkcf9gSRw (this was the first iOS+Swift video I ever watched)

Changed Things:

- TabBar VC in App Delegate can now be shared across all Swift files (This is how TabBar can be made hidden)
- Added Pod (for Parchment and other Pods installed or tried)

### Note

I'm not sure which .gitignore files from the github/gitignore repo I'm supposed to use. Trying to commit files without affiliating names here...
