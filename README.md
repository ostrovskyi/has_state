# has_state
**Ruby state management gem**

#### Available features:
* Support **Ruby on Rails**

## Usage example
```ruby
class Championship
    has_state do
        transition :group_phase => :drafts do
            ChampionshipDraft.create(championship: self)
        end
        
        transition :drafts => :elimination_phase do
            cd = ChampionshipDraft.find_by(championship_id: id)
            cd.update(closed_at: DateTime.now)
        end
    end
end
```
Then you are able to read and manage state:
```ruby
champ = Championship.find(17)
champ.state
=> :group_phase

champ.transition_to(:drafts)
=> true

champ.state
=> :drafts

champ.transition_to(:group_phase)
=> HasStateTransitionError (No possible transitions from state 'drafts' to 'group_phase')
```

### To be implemented
* Repository
    * Test coverage
    * CI
    * Badges
* Receiving configurations
    * Custom name for state field;
* Transitions module
    * Autosave;
* Same symbol and string support
* Detailed errors for exceptions
* Documentation
* Beginner guides