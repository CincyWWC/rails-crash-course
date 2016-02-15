class: slide--title

# Ruby on Rails Crash Course
## Women Who Code Cincinnati

---

# Schedule

* Welcome
* Introduction to Ruby
* Introduction to Rails
* Rails Workshop
* Wrap-up

---

class: slide--title

## Thank you to our sponsor
# Oodle.io

---

class: slide--title

# Introductions

---

# Resources

* All links to resources for this course can be found at
[https://github.com/CincyWWC/rails-crash-course](https://github.com/CincyWWC/rails-crash-course)
* You can quickly jump to a slide number by changing the number after the hash in the url

---

class: slide--title

# Introduction to Ruby

---

# History of Ruby

* Created by Yukihiro "Matz" Matsumoto in 1995 in Japan
* First English-language book was published in 2000
* Around 2005, DHH (David Heinemeier Hansson) was hired by 37Signals to create Basecamp

---

# History of Ruby

* Once Basecamp was built, DHH extracted the web framework used from it, creating **Rails**
* Rails has powered the popularity of Ruby ever since

---

# Running Ruby

* Ruby is an interpreted language, runs on a virtual machine (VM)
* There are multiple versions of the Ruby virtual machine, one of the most common being MRI (Matz's
Ruby Interpreter)

---

# Running Ruby

* Other examples of interpreted languages are
  * Javascript
  * Python
  * Perl
* You can run Ruby files on the command line using `ruby filename.rb`

---

# Interactive Ruby

* You can run Ruby commands interactively using the REPL
  * **R** - Reads in the command, parses it into memory
  * **E** - Evaluate the command
  * **P** - Print the result
  * **L** - Loop to start the process all over again
* `irb` is the command that starts the REPL for Ruby

---

class: slide--title

# Introduction to Rails

---

class: slide--title

# Workshop
## Making a blog in Rails

---

# What We'll Build

* We will be creating a simple blog using Ruby on Rails to practice what we've learned today

---

# Conventions Used

* If a line of code starts with `$`, it is a single command for your command line

```bash
$ ls -al
```

* Otherwise, assume it is Ruby code

```ruby
class Sample
end
```

---

# Creating Your First App

* To see the various options available when creating a new Rails project, use the command

```bash
$ rails help
```

---

# Creating Your First App

* We will create our project using

```bash
$ rails new wwc_blog --skip-spring
--skip-test-unit
```

* Spring pre-loads code to run commands faster, and is extremely useful on large projects. However,
it can sometimes cause things not to update. To avoid confusion, we are not going to use it today.

---

# Creating Your First App

* Now you have a simple app to run. Start the server by

```bash
$ cd wwc_blog
$ rails server
```

* You can now view your running app at `http://localhost:3000`

---

# Creating Your First Model

* We're going to start with blog posts in our app
* To create a post model, we use Rails generators on the command line

```bash
$ ./bin/rails generate model Post
title:string content:text
```

---

# Creating Your First Model

* Two files have been created
  * Model
  * Migration

`app/models/post.rb`
```ruby
class Post < ActiveRecord::Base
end
```

---

# Creating Your First Model

`db/migrate/YYYYMMDD######_create_posts.rb`
```ruby
class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content

      t.timestamps null: false
    end
  end
end
```

---

# Preparing the Database

* By default, Rails uses SQLite, which is appropriate for an example project
  * We typically use PostgreSQL for production-ready projects
* To get our database set up, do

```bash
$ ./bin/rake db:migrate
```
* This applies our new migration (and conveniently creates the database)

---

# Creating Our First Post

* We can create models through the Rails console
* The Rails console starts an `irb` session with your application already loaded

```bash
$ ./bin/rails console
Loading development environment (Rails 4.2.4)
irb(main):001:0> Post.create(
  title: 'My First Blog Post',
  content: 'I love cats!')
irb(main):002:0> exit
```

---

# Viewing Our Posts

* Now that we have a post, we want to be able to see it in our application
* Create a controller with an index method to display our posts

`app/controllers/posts_controller.rb`
```ruby
class PostsController < ApplicationController
  def index
    @posts = Post.all
  end
end
```

---

# Viewing Our Posts

* Then, tell our routes file about our posts resource

`app/config/routes.rb`
```ruby
Rails.application.routes.draw do
  root 'posts#index'

  resources :posts
end
```

---

# Viewing Our Posts

* If you view our app, you will get a missing template error. We need to add a view.
* View files are `.html.erb` files
* The `.erb` extension indicates that we will use "Embedded RuBy", which is the default templating
language for Rails.
  * `<%= code %>` will insert the result of code into the html
  * `<% code %>` will execute code, but not edit the html

---

# Viewing Our Posts

* Create a new view file:

`app/views/posts/index.html.erb`
```erb
<h1>WWC Blog</h1>

<ul>
  <% @posts.each do |post| %>
    <li><%= post.title %></li>
  <% end %>
</ul>
```

---

# Viewing Our Posts

* You can see our post! But it's not super pretty. Let's use Bootstrap to make styling our app easy.
* Lots of things are packaged up in Gems for Rails already. We will use
https://github.com/twbs/bootstrap-sass
* Most Gems have good setup instructions, **USE THEM!**
* Restart your server after installing gems, as it is not loaded in your application yet

---

# Adding a Common Header

* We can move the WWC Blog heading to `app/views/layouts/application.html` and a bootstrap
container

```erb
<div class="container">
  <div class="col-md-12">
    <div class="page-header">
      <h1>WWC Blog</h1>
    </div>

    <%= yield %>
  </div>
</div>
```

---

# Viewing a Post

* Of course, we want to see more than the title of our posts, we need to show individual posts
* The steps to add a show page are similar to adding the index
  * Add show handler to `PostsController`
  * show view to `app/views/posts/show.html.erb`

---

# Viewing a Post

`app/controllers/posts_controller.rb`
```ruby
def show
  @post = Post.find(params[:id])
end
```

---

# Viewing a Post

`app/views/posts/show.html.erb`
```erb
<h2>
  <%= @post.title %>
  <small>
    <%= @post.created_at
             .to_formatted_s(:long) %>
  </small>
</h2>

<p>
  <%= @post.content %>
</p>
```

---

# Viewing a Post

* We can now view our post at the URL `http://localhost:3000/posts/1`
* It would be convenient to use links to our posts for navigation
* Rails provides HTML helpers to handle basic actions, like linking, html forms, and paths
  * `link_to 'label', path`

---

# Path Helpers

* Path helpers are convenient ways to link to other parts of your application
* View all available routes, and their path helper name, using the rake command
`./bin/rake routes`
* Add `_path` to the end of the prefix to use the path helper
* You can also add `_url` to get the full URL

---

# Viewing a Post

`app/views/posts/show.html.erb`
```erb
<%= link_to 'Back to index >', posts_path,
    class: 'pull-right' %>
<h2>
...
```

---

# Viewing a Post

`app/views/posts/index.html.erb`
```erb
<li>
  <%= link_to post.title, post_path(post) %>
</li>
```

* If the route takes parameters, you can pass them to the path helper
