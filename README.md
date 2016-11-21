# Book a Doc  [![Build Status](https://travis-ci.com/nikklein/book_a_doc.svg?token=CPsPzN8ygyngftGnwWw6&branch=master)](https://travis-ci.com/nikklein/book_a_doc)

#### This app has been designed to allow to book an appointment with a doctor.		
#### In order to book a time slot it uses datasets loaded from a JSON file.

#### Installation

###### Clone the repository
```
$ git clone git@github.com:nikklein/book_a_doc.git>
$ cd book_a_doc
```
###### Run the following command to install all required gems:
```
$ bundle install
```

#### Book a time slot!

Add execute permissions to simplify program execution. Run the following command ```$ chmod 755 ./availability.rb``` and then run

```
$ ./availability.rb <preffered time>
```

or alternatively, simply run the command below

```
$ ruby ./availability.rb <preffered time>
```

#### Requirements

* Patients cannot book appointments before 8am and after 3pm
* Once an availability has been used up for an appointment it cannot be booked again
* Patient could potentially book an appointment for doctor 1 and 2 at the same time
* Program uses the JSON file provided to read datasets and update them after an appointment has been booked
* App is an executable ruby script
* App accepts time in 24H format(eg: 12:40)
* App prints time that was booked(eg: 13:40)
