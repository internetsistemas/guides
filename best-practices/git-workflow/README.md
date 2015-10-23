# Git Workflow

This guide provides a little introduction to a good way about how to use the Git workflow in Pull Requests and Branchs or somebody else.

## Our use cases:
 
 * Starting the development of a new feature (kinds of merge old code to new feature)
 * Commiting and pull requests.

### Starting the development

#### Without needing anything

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

#### Need of previous branches of things 

In other words, when you need some classes for eg. But it be in other branches you'll to get the "old" code before start.

```console
// update your branches.
$ git fetch origin
// create your branch normally.
$ git checkout -b feature/awesome
// now you need to reference old branch inside your new branch.
$ git fetch origin feature/old-awesome-feature:feature/old-awesome-feature
// and merge with your new branch.
$ git merge old-awesome-feature
```

#### What will happen?

Now, in your workflow you'll notice cool things!

- All commits about the `old-awesome-feature` will be desappear when it be merged with master as well.
- And all of old files too!
- Any reference stay in your new branch.
- Code Review facilitated!


**ERRORS**: You can get errors, when you don't have the old branch updated, so pay attention!

### Commits and Pull Requests

Generally we use micro commits as the default kind.

#### Naming things

##### Branches:

When you will develop a new feature use:

```
feature/sprint-02-story-10
```
But when you are creating a new bug fix for anything use:
```shell
# without issue related:  
bug-fix/sprint-02-story-10  

# with a issue #123 related:
bug-fix/sprint-02-issue-123
```

** If is done without a story included use without the `-story-10`.

##### Pull Requests:

*When my awesome job is...*

- *create a new model called `PaymentForm`* will turn **Feature/Model: Sprint 02 - Story 10 / PaymentForm**
- *create a new controller and views for `Place` model* will turn **Feature/Controller: Sprint 02 - Story 10 / Places** *²
- *create a new job called `CheckSomethingJob`* will turn **Feature/Job: Sprint 02 - Story 10 / CheckSomething** *²
- *create a new service called `SupplierService`* will turn **Feature/Service: Sprint 02 - Story 10 / Supplier** *²
- *fix a bug called Issue #1234* will turn **Bug Fix/Issue #1234: Sprint 02 - Story 10 [Module Name]** *¹
- *fix a bug called remove rubocop offences* will turn **Bug Fix/Code Refactor: Sprint 02 - Story 10 / Rubocop offences** (try to compress the name!)

\*¹ Add the *[ModuleName]* if your project works with this kind of organization.  
\*² Ommit the name of thing that you will create, like Controller and Jobs, because it will be in declaration of PR.

##### Master Comment at Pull Request:

The GitHub interface provides a master comment bellow the title of your pull request, there you can provide some explanations about your changes, but the most important thing is provide to code reviewer a way to do what you need to do, in other words, provide a link used by your project management added to it like:

*Pull request related with:* [https://trello.com/c/bCd4/something](https://trello.com/c/bCd4/something)
