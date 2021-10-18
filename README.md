# has_state
**Ruby state management gem**

[![CircleCI](https://circleci.com/gh/ostrovskyi/has_state.svg?style=shield)](https://circleci.com/gh/ostrovskyi/has_state)

#### Available features:
* Support plain Ruby, **Ruby on Rails**

## Usage example
```ruby
class Championship
    has_state do
        transition :group_phase => :drafts do
            ChampionshipDraft.create(championship: self)
        end
        
        transition :drafts_passed, :drafts => :elimination_phase do
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
```

### Customization
#### Change initial state value
```ruby
class Event
    has_state default: :pending do
        ...
    end
end

event = Event.all.sample
event.state
=> :pending
```

#### Use custom field name
```ruby
class Championship
    has_state field: :phase do
        ...
    end
end

ch = Championship.last
ch.phase
=> :elimination
```

### To be implemented
* Options
  * Force string values as methods result
* Transitions module
  * Autosave
  * Callbacks
* Requirements module
* Frakework/ORM connections
  * ActiveRecord
  * DataMapper
  * GraphQL
* Initializer config feature
  * Default options (per-project)
  * Framework or ORM specifying
* Same symbol and string support
* Detailed errors for exceptions
* Fix all rubocop issues
* Documentation
* Publish to rubygems