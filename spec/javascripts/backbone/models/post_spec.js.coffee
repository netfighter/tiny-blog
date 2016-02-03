describe "Post Model", ->

  it "should exist", ->
    expect(Blog.Models.Post).toBeDefined()

  describe "Attributes", ->
    post = new Blog.Models.Post

    it "should have default attributes", ->
      expect(post.attributes.title).toBeDefined()
      expect(post.attributes.content).toBeDefined()

  describe "Validations", ->
    attrs = {}

    beforeEach ->
      attrs =
        title: 'Sample Title'
        content: 'Sample Content'

    afterEach ->
      post = new Blog.Models.Post attrs
      expect(post.isValid()).toBeFalsy()

    it "should validate the presence of title", ->
      delete attrs["title"]

    it "should validate the presence of content", ->
      delete attrs["content"]
