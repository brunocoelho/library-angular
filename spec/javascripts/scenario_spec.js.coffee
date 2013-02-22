describe 'Login page', ->
  it 'should not redirect to books page with wrong credentials', ->
    input('user[email]').enter 'bruno@gmail.com'
    input('user[password]').enter '12345678'
    elemento('commit').click()
    expect(browser().location().url()).toBe '/'

  xit 'should redirect to books pages with right credentials', ->
