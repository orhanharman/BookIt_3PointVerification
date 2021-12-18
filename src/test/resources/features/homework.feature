Feature: Testing the whole information of a person with three layer of verification

  Scenario: UI,API,DB verification
    Given user logs in using "gmalkin7j@mail.ru" "christopheflory"
    When user is on the my self page
    And I get the current information from UI
    And I logged Bookit api using "gmalkin7j@mail.ru" and "christopheflory"
    And I get the current user information from api
    And I get more information about user from API
    And I get the current user information from database
    Then All five information from three layer should match

  @hw @db
  Scenario Outline: UI,API,DB Verification <email>
    Given user logs in using "<email>" "<password>"
    When user is on the my self page
    And I get the current information from UI
    And I logged Bookit api using "<email>" and "<password>"
    And I get the current user information from api
    And I get more information about user from API
    And I get the current user information from database
    Then All five information from three layer should match
    Examples:
      | email                     | password        |
      | sbirdbj@fc2.com           | asenorval       |
      | gmalkin7j@mail.ru         | christopheflory |
      | vtugman7k@joomla.org      | daryledikles    |
      | daldie7l@seattletimes.com | ruthannjohnes   |
      | rkernocke7m@cnet.com      | merrileeambler  |



#  From UI
#  Ase Norval
#  student-team-leader
#  Cucumber: team name
##8 : batch number
#  IL : campus name
#
#  From DataBase:
#  Ase Norval           : users table
#  student-team-leader     : users table
#  Cucumber: team name  : team table
##8 : batch number    : team table
#  IL : campus name     : campus table
#  Query for DB
#  select firstname,lastname,role,batch_number,name,location
#  from users u join (select t.name,t.id,t.batch_number,c.location
#  from team t join campus c on t.campus_id=c.id)j
#  on u.team_id = j.id where email='gmalkin7j@mail.ru';
#
#  From API
#  Ase Norval           : {{bookIturl}}/api/users/me
#  student-team-leader     : {{bookIturl}}/api/users/me
#  Cucumber: team name  : {{bookIturl}}/api/teams/my
##8 : batch number    : {{bookIturl}}/api/batches/my
#  IL : campus name     : {{bookIturl}}/api/campuses/my