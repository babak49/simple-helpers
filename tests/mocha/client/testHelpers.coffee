if typeof MochaWeb isnt 'undefined'
    MochaWeb.testOnly ->
        values =
            'eq': [
                'a': 1
                'b': 1
            ,
                'a': 0
                'b': 0
            ,
                'a': 'test'
                'b': 'test'
            ,
                'a': [1]
                'b': [1]
            ,
                'a': {}
                'b': {}
            ],
            'notEq': [
                'a': 2
                'b': 1
            ,
                'a': 0
                'b': 1
            ,
                'a': 'test _'
                'b': 'test'
            ,
                'a': [2]
                'b': [1]
            ,
                'a': {a: 'test'}
                'b': {}
            ],
            'andTrue': [
                'a': 1
                'b': '1'
            ,
                'a': true
                'b': true
            ,
                'a': [1]
                'b': [1]
            ,
                'a': {a: 'test'}
                'b': {b: 'test'}
            ],
            'andFalse': [
                'a': 1
                'b': ''
            ,
                'a': true
                'b': false
            ,
                'a': undefined
                'b': [1]
            ,
                'a': {a: 'test'}
                'b': null
            ],
            'orFalsy': [
                'a': false
                'b': false
            ,
                'a': null
                'b': null
            ,
                'a': undefined
                'b': undefined
            ,
                'a': ''
                'b': ''
            ]

        describe("Helper isEq", ->
            values.eq.forEach (test) ->
                it("should be eq #{JSON.stringify(test.a)} and #{JSON.stringify(test.b)}", ->
                    chai.assert.isTrue Blaze._globalHelpers.isEq(test.a, test.b)
                )

            values.notEq.forEach (test) ->
                it("shouldn't be eq #{JSON.stringify(test.a)} and #{JSON.stringify(test.b)}", ->
                    chai.assert.isFalse Blaze._globalHelpers.isEq(test.a, test.b)
                )
        )

        describe("Helper isNotEq", ->
            values.eq.forEach (test) ->
                it("should be eq #{JSON.stringify(test.a)} and #{JSON.stringify(test.b)} and return FALSE", ->
                    chai.assert.isFalse Blaze._globalHelpers.isNotEq(test.a, test.b)
                )

            values.notEq.forEach (test) ->
                it("shouldn't be eq #{JSON.stringify(test.a)} and #{JSON.stringify(test.b)} and return TRUE", ->
                    chai.assert.isTrue Blaze._globalHelpers.isNotEq(test.a, test.b)
                )
        )

        describe("Helper and", ->
            values.andTrue.forEach (test) ->
                it("expected #{JSON.stringify(test.a)} and #{JSON.stringify(test.b)}", ->
                    chai.assert.isTrue Blaze._globalHelpers.and(test.a, test.b)
                )

            values.andFalse.forEach (test) ->
                it("Expected #{JSON.stringify(test.a)} or #{JSON.stringify(test.b)} and return False", ->
                    chai.assert.isFalse Blaze._globalHelpers.and(test.a, test.b)
                )
        )

        describe("Helper or", ->
            values.andTrue.forEach (test) ->
                it("expected #{JSON.stringify(test.a)} or #{JSON.stringify(test.b)}", ->
                    chai.assert.isTrue Blaze._globalHelpers.or(test.a, test.b)
                )

            values.orFalsy.forEach (test) ->
                it("Expected OR will return false a = #{JSON.stringify(test.a)} b = #{JSON.stringify(test.b)}", ->
                    chai.assert.isFalse Blaze._globalHelpers.or(test.a, test.b)
                )
        )