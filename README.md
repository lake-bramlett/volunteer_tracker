# _Volunteer Tracker_

#### _Code Review, 2 August 2019_

#### By _**Lake Bramlett**_

## Description

_'Volunteer Tracker' is an application designed to enter individual projects and volunteers into a database, assign those volunteers to specific projects, and keep record of how many hours each individual volunteers has worked across all projects and how many aggregate hours each project has had worked for it._

## Setup/Installation Requirements

* _Clone https://github.com/lake-bramlett/volunteer_tracker repo locally_
* _In the command line, navigate to the clone repo_
* _Initiate a `bundle install` in the command line_
* _Run `ruby lib/anagrams_script.rb` for terminal script_
* _Use preferred text editor to edit_
* _Make any pull requests to https://github.com/lake-bramlett/anagram ._

## Specs
|Spec|Input|Output|
|---- |:---:|----:|
| returns false if one or more words are no valid | 'sdfs','ruby' | false |
| returns true if both words are valid | 'goat','ruby' | true |
| returns 'not an anagram' if two words are not anagrams | 'goat','pork'| not an anagram |
| returns 'anagram' if two words are anagrams | 'goat','toga' | anagram |
| returns matching letters for non-anagram results | 'one','two' | 'o' |
| returns 'antigram' if two words share none of the same letters | 'pork', 'field' | antigram |
| returns 'anagram' or 'antigram' if two words are anagrams despite capitalization variance | 'goat','Toga' | anagram |
| returns 'anagram' for two phrases that are anagrams |'School master','The classroom'  | anagram |
| returns 'antigram' for two phrases that are antigrams | 'I am sick','get your gun' | antigram |

  ## Known Bugs

  _There are no known bugs at this time (19 July 2019)._

  ## Support and contact details

  _email: lake.bramlett@gmail.com_

  ## Technologies Used


  * _Ruby_
  * _rspec_
  * _Git_


  ### License

  *This software is licensed under the MIT license.*

  Copyright (c) 2019 **_Lake Bramlett_**
