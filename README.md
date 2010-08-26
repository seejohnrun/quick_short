# Quick Short (WORK IN PROGRESS)

### What is this?

This is a Rails gem for creating local short urls with no lookup.  Its awesome.  __Yes, the name is a play on 'quick sort'__

The idea is pretty simple.  Instead of using a short ID lookup table, we change the base of the primary key and use it as a short_id.  You can see more details about the original idea at http://engineering.patch.com/quick-local-shorturls

### Requirements

* Models you want to use this with must have a single, numeric primary key

### Authors

* John Crepezzi

### License 

(The MIT License)

Copyright © 2010 John Crepezzi <john.crepezzi@gmail.com>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the ‘Software’), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED ‘AS IS’, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE. 
