## SM-Sample_Application
This Sample_Application covered all basic concepts like
#### Calendar(Full Calendar Plugin)  
[Calendar view like Full Calendar](http://fullcalendar.io)  
(FullCalendar is for displaying events, and it is a solution for event content-management. Beyond dragging an event to a different time/day, you can change an event's name, etc )  
+ You can add Calendar(e.g Test-Calendar 1), Every calendar has color
+ Add Events for particular Calendar, Events have different color.

#### Taggable(Select2)
[Taggable View Like Demo Select2](https://select2.github.io/examples.html)  
(Select2 add a form field which can auto fill text & can take multiple tabs(similar to fb) and gives you a customizable select box with support for searching, tagging, remote data sets, infinite scrolling, and many other highly used options.). Here in our application  
+ Multiple attribute show in select2 field
+ You can choise and search from dropdown and also add new which is not predefined in select2 dropdown.   

#### Nested forms(cocoon)
[Cocoon Documentation](https://github.com/nathanvda/cocoon)  
(Make dynamic nested forms). In Our application
+ Add multiple task(form) against project.  

#### Authentication(Devise)
[Flexible authentication solution for Rails](https://github.com/plataformatec/devise)  
(Allows you to have multiple models signed in at the same time.). In our application  
+ Also Login from Google [Here Documentation](https://github.com/zquestz/omniauth-google-oauth2)  

#### STI-Single Table Inheritance(Enumeration)
[STI lets you save different models inheriting from the same model inside a single table.](http://samurails.com/tutorial/single-table-inheritance-with-rails-4-part-1/)  
For example  
+  You have an employee model.
+ The employees can be of two types : manager or developer(They pretty much share the same attributes and columns.Creating two tables having the exact same fields would be bad.)
+ With STI, you can just keep your employee model and simply subclass it with your two types of employee.  
###### How To Implement

```javascript
'In MODEL'      :

			class Enumeration < ActiveRecord::Base
				    
			end

			class Child < Parend

			end
'In CONTROLLER' :
			def new
		    	   @enumeration = Enumeration.new(type: params[:type])
		        end
'In Views'      :
		    Where Linke
				<% @enumerations.subclasses.each do |subclass| %>
					  <%= link_to subclass, new_enumeration_path(type: subclass) %>
				<% end %>
		    Where Form
				<%= form_for @enumeration.becomes(Enumeration) do |f| %>  
become use for  
              change from a superclass to a subclass without accessing the “type” attribute directly.  
	      Returns an instance of the specified klass with the attributes of the current record.
```
#### Pagination(Kaminari)
[Flexible solution for pagination](https://github.com/amatsuda/kaminari)
###### How To Implement  
 
```javascript
gem 'kaminari'
bundle install
In CONTROLLER :  @instance_variable = Model.all.order("id asc").page( params[:page]).per(2)
In VIEW       :  <%= paginate @instance_variable %>

