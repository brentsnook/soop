Soop
====

Soop provides automagic mixing for your classes allowing you to keep other logic (such as presentation) from polluting the domain.

Mixins are specified at the module level (i.e. mix Presentation into Core). 

Classes can be mixed on demand or by hooking into ActiveSupport constant loading. Soop will search for corresponding mixins as a class is loaded via ActiveSupport.

At the moment Soop is a work in progress. A tagged release will be created when it's ready to go. 

Example
=======

In your Rails project you have a *target* module called *Domain* and a *mixin* module named *Presentation*:

  module Domain
    class Cat
      def noise
        'meow'
      end
    end
  end
  
  module Presentation
    module Cat
      def formatted_noise
        "<i>#{noise}</i>"  
      end
    end
  end

In your *environment.rb* you add:

  Soop.mix Core, :with => Presentation
  
And voila:

  Domain::Cat.new.formatted_noise
    => '<i>meow</i>'

Installation
============

Install as a plugin in a Ruby on Rails app:

	$ script/plugin install git://github.com/brentsnook/soop.git


Copyright (c) 2010 Brent Snook [http://github.com/brentsnook](http://github.com/brentsnook), released under the MIT license