# Medium Clone

## epilogue
was thinking about a project to practice and as a showcase for my skills in Ruby on Rails.

was thinking about creating a forum due to with it I can cover the following topic:
- table relationship
  - user following and follower
  - story, user, categories, comments
- user authentication (using devise)
  - sign up / sign in
  - password recovery
  - authentication token
  - block on failed try
- voting (using act_as_vote)
  - vote for story (likes)
- email notification (haven't decide the gem for this)
  - on new response
- file upload (using paperclip)
- bootstrap styling
  - breadcrumb
  - pagination
  - all other common bootstrap components

and while drafting the Relationship model, I realize that the category/ies
is such a annoyance from user point of view (imagine that you have to think the thread you are writing belong to which category and sub-category AND the embarrassment when the response say you post it on the wrong category)

therefor I thought it will be better to just use tags, something like a stack overflow BUT I don't want it to look like traditional forum structure after-all it will be called a story so should be something more inviting.

and when I look around for inspiration it turn out what I want "Medium" (minus the awesome editor [for the moment]).

P.S: this will also serve as base for upcoming experiment project (Instagram's
Clone and an e-commerce site)


## To Do List
1. Story  => Done
2. User + authentication using devise => Done
3. Comment => Done (only the last can be edited / deleted by commenter)
3. Add Voting (for user and story) => done
4. Follow and Following feature
5. Trending tags on the home (keep track of tags by story;)
6. Populate database with dummy data (faker gem)

I'll only apply basic styling for this project as aesthetics can hold until all
the feature is implemented.

Improvement:
- edit comment on the same page
- partial for new and edit comments
- minimize existing routes
