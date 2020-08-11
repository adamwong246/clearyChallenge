# Cleary-Git-Friends

## Table of Contents

1. Abstract
2. Customer Requirements
3. Technologies
4. Internal API
5. Ranking Algorithms
6. Schema
7. External API
8. Timeline

---

## Abstract

Build a Rails + React application that, given a specific github username, will output a list of people that user has interacted with on github using the github api (https://developer.github.com/v3/), and have some kind of way to rank them.

Create an app with 2 pages - one with a table view ranking interaction types, and one that has a suggestion box similar to the one in the screenshot above

- Table view: a list of other github users ranked based on some interactions that the user has had with them in github.
 - It should be designed to support different types of interactions
 - At a minimum, you should consider pull request comments as an interaction type
 - The table should have filters that allow you to slice the data by date range
 - The table columns should be sortable

- Suggested shoutout UI
 - Similar to the one in the screenshot above
 - You can ignore the actual shoutout sending (don't need to implement a modal to actually send the shoutout)
 - Determine the algorithm used to show the suggested users based on data from the table view

Additional Considerations
- Performance - when and how often does the data get computed? How would you store this data so it’s performant?
- Extensibility - what if we wanted to add something like bitbucket as a new data source?
- Validations - are the models using appropriate validations to ensure data integrity?

Bonus Challenge
- In addition to pull request comments, support additional interaction types (for example, when someone is @mentioned, reactions, issues, approvers, reviewers, etc)
- Implement the actual shoutouts that can be sent to other users
- Create a feed of each interaction on the homepage below the suggested shoutouts box
- For example: DHH commented on tenderlove’s PR


---


### Customer Requirements

#### "Home page"
A basic splash screen describing the app, with github login widget. If logged in, show a list of shoutouts for a user.

#### "Table page"
a table view of users.
This page serves as an administrative view of the data. As such, it need not be styled for public consumption and can be without heavy styling.
This page will be server-side generated.
##### components
- "user search form":
 - date-range ie 2 date inputs
 - github user name input with live typeahead search.
- "users table":
 - 1st dimension is of other users
 - 2nd dimension is a rank algorithms
 - sortable by date of interaction and rank scores

#### "Suggested Shoutouts page"
a list view of users and a list view of interactions
##### components
- "shoutouts list" component, which sequentially lists github users.
 - Users are sorted by a "secret sauce" algorithm which takes into account many criters (TBD)
- "interactions list" component, which sequentially lists the interactions
 - interactions are sorted by date


 ---


### Technologies
- Ruby (latest version)
- Rails (latest version)
- React (latest version)
- Postgres (latest version)
- React-Bootstrap (latest version)


---


### Internal API

#### GET /
Homepage which shows basic description, login, and shoutouts made to current user

#### POST /user {username}
Create a new user account

#### GET /users {username, startTime, endTime, rankAlgorithm}
Returns a list of related github users, given a username and a bounding time and ranking algorithm

#### GET /suggestions {username}
Displays the suggestions widget.

#### POST /shoutout


---


### Ranking algorithms
- mentions
- reactions
- issues
- approvers
- reviewers
- "commendations" aka "secret sauce rank"
  When a users interactions are refreshed via the github api, the users are ranked by the multiple types of interactions. For each type, the user with the max number of each will be given a special commendation. The number of accumulated commendations is returned for the "secret sauce" rank.


  ---


### Schema
#### Users
- github user : json
- github user-relation : json

#### Shoutouts
- fromUserId : string
- toUserId : string
- commendation : id
- dateCreated


---


### External API

[`GET /users/:username/received_events`](https://developer.github.com/v3/activity/events/#list-events-received-by-the-authenticated-user)

These are events that you've received by watching repos and following users. If you are authenticated as the given user, you will see private events. Otherwise, you'll only see public events.


---


### Timeline (6 working days total)

#### Phase 0: Planning (1 Day)
- Right TDD
- Research Github api

#### Phase 1: non-functional boilerplate (1 Day)
- Initialize the project with ruby, rails and postgres
- Add user login via Github
- Add basic routes, pages and non-functional components

#### Phase 2: Business logic (1 Day)
- TDD and implement "refresh" functionality which fetches and parses Github api results

#### Phase 3: MVP (1 Day)
- TDD and implement API
 - "GET /users"
 - "GET /suggestions"

- TDD and implement controller actions
 - "list users"
 - "suggest users"

#### Phase 4: (1 day)
- add react
- implement components
 - "user search form"
 - "user results table"
 - "shoutouts list"
 - "interactions list"
- CSS/styling

#### Phase 5: Extras (1 day)
- Add shoutouts table via migration
- Modify controller actions to include list of shoutouts
- TDD and implement "shoutout" button on "Suggest users" component
- TDD and implement "shoutout list"

#### Phase 6: - Functionally test with Cucumber
