# Bootstrap for Square

`bootstrap-square` is a Sass-powered version of [Bootstrap](http://github.com/twbs/bootstrap) with Square styles, ready to drop right into your Sass powered applications.

You can refer to all of the Bootstrap documentation but note that all styles will be Baltimore-esque (Dashboard styles).  This is still a work in progress, but is being actively developed.

## Installation

Please see the appropriate guide for your environment of choice:

### a. Ruby on Rails

`bootstrap-sass` is easy to drop into Rails with the asset pipeline.

In your Gemfile you need to add the `bootstrap-sass` gem, and ensure that the `sass-rails` gem is present - it is added to new Rails applications by default.

```ruby
gem 'sass-rails', '~> 4.0.2'
gem 'bootstrap-square', git: 'https://stash.corp.squareup.com/scm/sq/bootstrap-square.git'
```

`bundle install` and restart your server to make the files available through the pipeline.

## Usage

### Sass

Import Bootstrap Square into a Sass file (for example, `application.css.scss`) to get all of Bootstrap Square's styles, mixins and variables!
We recommend against using `//= require` directives, since none of your other stylesheets will be [able to access][antirequire] the Bootstrap mixins or variables.

```scss
@import "bootstrap-square";
```

### Javascript

We have a helper that includes all Bootstrap javascripts. If you use Rails (or Sprockets separately),
put this in your Javascript manifest (usually in `application.js`) to load the files in the [correct order](/vendor/assets/javascripts/bootstrap.js):

```js
// Loads all Bootstrap javascripts
//= require bootstrap-square
```

You can also load individual modules, provided you also require any dependencies. You can check dependencies in the [Bootstrap JS documentation][jsdocs].

```js
//= require bootstrap-Square/scrollspy
//= require bootstrap-square/modal
//= require bootstrap-square/dropdown
```
