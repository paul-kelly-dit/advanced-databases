use myblog

db.posts.insertOne({
  "blog": "Blog Post 4",
  "content": "my blog content",
  "likes": 6,
  "comments": [
    {
      "text": "nice post!",
      "user": "paul",
      "date": "24/02/2021"
    },
    {
      "text": "very cool",
      "user": "john",
      "date": "24/02/2021"
    },
    {
      "text": "excellent!",
      "user": "zoe",
      "date": "24/02/2021"
    },

  ]
});

db.posts.insertOne({
  "blog": "Travel Blog",
  "content": "my blog content",
  "likes": 12,
  "comments": [
    {
      "text": "awesome!",
      "user": "paul",
      "date": "24/02/2021"
    }
  ]
});

-- find all blog posts that paul commented on
db.posts.find( { "comments.user" : { $eq: "paul" } } )

-- find posts with likes greater than 3
db.posts.find( { likes: { $gt: 3 } } )

db.posts.deleteMany({});


