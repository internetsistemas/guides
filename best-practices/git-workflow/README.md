# Git Workflow

This guide provides a little introduction to a good way about how to use the Git workflow in Pull Requests and Branchs or somebody else.

## Our use cases:

### Without needing anything

Suppose if you want to start a new awesome feature and all of you need are in `master` branch, just start!

```console
// update your branches.
$ git fetch origin
// ensures that you will get from the master
$ git checkout master
// and updated
$ git pull origin master 

// now, enter in your branch
$ git checkout -b feature/awesome
// happy coding!
```

### Need of previous branches of things 

In other words, when you need some classes for eg. But it be in other branches you'll to get the "old" code before start.

```console
// update your branches.
$ git fetch origin
// create your branch normally.
$ git checkout -b feature/awesome
// now you need to reference old branch inside your new branch.
$ git fetch origin feature/old-awesome-feature
// and merge with your new branch.
$ git merge old-awesome-feature
```

### What will happen?

Now, in your workflow you'll notice cool things!

- All commits about the `old-awesome-feature` will be desappear when it be merged with master as well.
- And all of old files too!
- Any reference stay in your new branch.
- Code Review facilitated!


**ERRORS**: You can get errors, when you don't have the old branch updated, so pay attention!
