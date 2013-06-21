# Formal

[![Gem Version](https://badge.fury.io/rb/formal.png)](http://badge.fury.im/rb/formal)
[![Build Status](https://travis-ci.org/mrmicahcooper/formal.png?branch=master)](https://travis-ci.org/mrmicahcooper/formal)
[![Code Climate](https://codeclimate.com/github/mrmicahcooper/formal.png)](https://codeclimate.com/github/mrmicahcooper/formal)

Formal is simply a form builder that provides the markup typically used
around form fields on Hashrocket projects.

## Installation

Add this line to your application's Gemfile:

    gem 'formal'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install formal

## Usage

Specify the builder option in your `form_for` parameters

```ruby
form_for(obj, builder: Formal::FormBuilder)
```

### Label

Label is created with error messaging within `label` element

Example:

```ruby
= f.label attribute
```

When `obj.attribute` is in an invalid state the markup returned will be like:

```html
<label for='obj_attribute'>Attribute <span class='error'>Error message</span></label>
```

## Rails Default Form Builder

To make formal the default form builder for your application, just run:

```ruby
rails g formal:install
```

This removes the need to add the `builder: Formal::FormBuilder` option to your
`form_for`

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
