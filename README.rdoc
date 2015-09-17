### Overview

This project is focused on practicing:

* rails
* database schema design (use the [online schema designer](http://ondras.zarovi.cz/sql/demo/))
* authentication
* authorization
* git workflow



### Project Option 1: IdeaBox

The following are the specs we were assigned for this mini-project.

#### Categories

* ideas belong to a category
* categories can be created and destroyed by a logged-in admin user (regular logged in users cannot create or destroy categories)
* users can create, edit/update, show, and destroy only their own ideas
* when a user types a new idea into the form, there is a [selection dropdown](http://guides.rubyonrails.org/form_helpers.html#option-tags-from-a-collection-of-arbitrary-objects) for choosing the correct category

#### Images

* allow users to add images to their ideas
* an image can have many ideas and an idea can have many images
* images can only be created by an admin user

The most simplistic way to implement images is to store a url to an online image. If you're feeling fancy and want to upload your own images, check out [Carrierwave](https://github.com/carrierwaveuploader/carrierwave) or [Paperclip](https://github.com/thoughtbot/paperclip).

#### Authentication and Authorization

* users need to log in to see their ideas
* users can only see their own ideas -- they should not be able to visit another user's page
* users cannot create ideas for other users
* users cannot create new categories -- only the admin can do that
* users cannot create images -- only the admin can do that; however, a user can assign an image to their idea
* visitors can create user accounts

#### Optional Extensions

* Use Heroku to host your app
* Implement Twitter, Github, or Facebook OAuth login
