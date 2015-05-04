UI.registerHelper('isEq', (a, b) ->
    if typeof a is "object" or typeof b is "object"
        JSON.stringify(a) is JSON.stringify(b)
    else
        a is b
)

UI.registerHelper('isNotEq', (a, b) ->
    if typeof a is "object" or typeof b is "object"
        JSON.stringify(a) isnt JSON.stringify(b)
    else
        a isnt b
)

UI.registerHelper('and', (a, b) ->
    !!(a and b) and !!(b and a)
)

UI.registerHelper('or', (a, b) ->
    !!(a or b)
)
UI.registerHelper('not', (a) -> !!!a)
UI.registerHelper('gt', (a, b) -> a > b)
UI.registerHelper('lt', (a, b) -> a < b)
UI.registerHelper('selected', (type, value) ->
    'selected' if type is (value or @type)
)
UI.registerHelper('isSelected', (type, value) ->
    if value instanceof Object then type == @type else type == value
)

UI.registerHelper('col', (arr) ->
    colArr = [
        'col-lg'
        'col-md'
        'col-sm'
        'col-xs'
    ]
    result = ''
    arr = arr.split(',')
    prev = if arr.length > 0 then arr.length - 1 else 0

    for i of colArr
        result += " #{colArr[i]}-#{$.trim(arr[(if arr[i] then i else prev)])}"
    result
)

UI.registerHelper('colOffset', (arr) ->
    colArr = [
        'col-lg-offset'
        'col-md-offset'
        'col-sm-offset'
        'col-xs-offset'
    ]
    result = ''
    arr = arr.split(',')
    prev = if arr.length > 0 then arr.length - 1 else 0

    for i of colArr
        result += " #{colArr[i]}-#{$.trim(arr[(if arr[i] then i else prev)])}"

    result
)

UI.registerHelper('getUserName', (id) ->
    user = Meteor.users.findOneFaster(id)
    "#{user.profile.surname || ''}  #{user.profile.name}" if user
)

UI.registerHelper('getUserEmail', (id) ->
    user = Meteor.users.findOneFaster(id)
    user.emails[0].address
)

UI.registerHelper('formatDate', (date, format = 'DD.MM.YYYY') ->
    moment(date).tz('Europe/Kiev').format(format)
)

UI.registerHelper('UserIsInRole', (roles, name) ->
    for i of roles
        if roles[i] == name
            return true
    false
)

UI.registerHelper('timeIsAfter', (time) ->
    moment(time, 'HH:mm').isBefore(new Date())
)