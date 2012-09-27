# Formal

Formal is simply a form builder that provides the markup we typically use
around form fields on Hashrocket projects.

## Installation

Add this line to your application's Gemfile:

    gem 'formal'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install formal

## Usage

Specify the builder option in your form_for parameters

```ruby
= form_for post, builder: Formal::Builder do |f| 
```


```f.label``` gets wrapped in a ```<dt>``` or a ```<dt class="error">```(wherethere is an error)


The following get wrapped in a ```<dd>``` or a ```<dd class="error">```:

```ruby
f.text_field
f.password_field
f.text_area
f.select
f.email_field
f.search_field
```

__Example:__

```ruby
f.text_field :body 
```

returns

```HTML
<dd>
  <input type="text" id="post_body" name="post[body]" />
</dd>
```

Also provided is a helper for a label with a checkbox __inside__ it (which is
also wrapped in a ```<dt>```). Use:

```ruby 
f.checkbox_with_label :published
```

which returns:

```html
<dt>
  <label for="post_published">
     <input name="post[published]" type="hidden" value="0" />
     <input id="post_published" name="post[published]" type="checkbox" value="1" /> 
     published
  </label>
</dt>
```





## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
