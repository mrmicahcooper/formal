# Formal

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'formal'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install formal

## Usage


Specify the builder option in your form_for parameters

```
  = form_for post, builder: Formal::Builder do |f|
```

This will wrap a ```<dt>``` around labels and a ```<dd>``` around the following helpers:

- label_tag
- text_field
- password_field
- text_area
- select
- email_field
- search_field


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
