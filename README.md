# BackEnd Task README

## Overview
An application that allows you to download `.json` and `.csv` files from responses from https://bored-api.appbrewery.com/random, including printing results in the console.

## Prerequisites
- Ruby (version 3.3.0)
- Rails (7.1.3.2)

## Setup
1. Clone this repository
2. Using your CLI, `cd your-repo-path`
3. run `bundle install`
4. run `rails server` or `rails console`

## How to Use
This application uses the following path format for browser requests after running `rails server`: `/api/tasks/:number_of_requests/:format`

Console-initiated actions are done using this class: `AppBrewery::Generate`, json and csv use the `console_task` method, while console uses `task`

Note that API requests are limited to 100 requests every 15 minutes.

### To download a JSON file
#### Using the browser: 
Sample path: `localhost:3000/api/tasks/5/json`
#### Using Rails Console:
```ruby
# Parameters for #console_task are number_of_requests and type.
file = AppBrewery::Generate.new
file.console_task(1, 'json')
```
<em><b>Files generated using the console are saved at the project's root path</b></em>

### To download a CSV file
#### Using the browser:
Sample path: `localhost:3000/api/tasks/3/csv`
#### Using Rails Console:
```ruby
file.console_task(1, 'csv')
```
### To display results in the console
#### Using the browser:
Sample path: `localhost:3000/api/tasks/1/console`
The results will be displayed on the console running puma:
```bash
    Data from App Brewery /random
    {"activity":"Go see a Broadway production","availability":0.3,"type":"recreational","participants":4,"price":0.8,"accessibility":"Few to no challenges","duration":"hours","kidFriendly":true,"link":"","key":"4448913"}
```
A rails web console has also been added as a view for this route and results would be made available by checking the instance variable `@response` using the web console.
#### Using the console:
```ruby
    # #task(number_of_requests, type)
    file.task(1,'console')
```