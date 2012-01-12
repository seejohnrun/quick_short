# Quick Short

[![Build Status](https://secure.travis-ci.org/seejohnrun/quick_short.png)](http://travis-ci.org/seejohnrun/quick_short)

## What is this?

This is a gem for creating short urls with no lookup needed.  Its awesome.

The idea is pretty simple.  Instead of using a short ID lookup table, we change the base of the primary key and use it as a short_id.  You can see more details about the original idea in [this blog post](http://seejohncode.com/2010/04/22/quick-local-short-urls).

## Encoding and Decoding keys

If you want to encode and decode keys directly:

``` ruby
QuickShort::ShortId.encode(123) # "dy"
QuickShort::ShortId.decode('dy') # 123
```

## Mixing it in

First, extend the object you'd like to use `QuickShort` with (possibly in a Rails initializer):

``` ruby
require 'quick_short'
ActiveRecord::Base.send(:extend, QuickShort::HasShortId)
```

And then, given your object defines `id`, you can use use `has_short_id`:

``` ruby
class Article < ActiveRecord::Base
  has_short_id 'art'
end
```

Then you can use `short_id`:

``` ruby
article.id # 123
article.short_id # "a-dy"
```

Decoding the record is straightforward:

``` ruby
QuickShort.find("a-dy") # Article:123
```

By registering multiple prefixes, you can get general short urls and then do something like:

``` ruby
def lookup
  redirect_to QuickShort.find("a-dy")
end
```

If you want something other than `find` or `find_by_short_id`, you can use `lookup`:

``` ruby
# directly
QuickShort.lookup("a-dy") # [Article, 123]

# or with a block
QuickShort.lookup("a-dy") do |klass, id|
end
```

See the documentation for more details!

## Authors

* John Crepezzi

## License 

(The MIT License)

Copyright © 2010-2012 John Crepezzi [john.crepezzi@gmail.com](mailto:john.crepezzi@gmail.com)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the ‘Software’), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED ‘AS IS’, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE. 
