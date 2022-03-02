// this creates todo database
use todo

// insert a document into database
db.tasks.insertOne({name:"Learn Inserts",});

// list all databases
show databases

// drop a database
db.dropDatabase()


db.tasks.insertOne({
    name: "Learn MongoDB",
    date: new Date(),
    priority: 1,
    status: "pending",
    user: "paul",
    assignee:"paul"
});

db.tasks.find({
    status: "pending",
});


db.tasks.insertMany([
  {
      name: 'Task 1',
      assignee: {
        username: 'user_a',
      },
  },
  {
      name: 'Task 2',
      assignee: {
            username: 'user_b',
      },
  }
]);


db.tasks.find({
    'assignee.username': { $eq: 'user_a' },
})

db.tasks.insertMany([
{
        name: 'Task 1',
        categories: [{
            key: 'category_a',
        }, {
            key: 'category_b',
        }]
},
{
        name: 'Task 2',
        categories: [{
            key: 'category_c',
        }, {
            key: 'category_d',
        }]
}
]);

// greater than example
db.tasks.insertMany([
{
  name: 'Task 1',
  priority: 1,
},
{
  name: 'Task 2',
  priority: 2,
}
]);

db.tasks.find({
    priority: {
        $gt: 1,
    },
});


// $and operator
db.tasks.insertMany([
{
  name: 'Task 1',
  priority: 1,
  status: 'pending',
},
{
  name: 'Task 2',
  priority: 1,
  status: 'completed',
},
{
  name: 'Task 3',
  priority: 2,
  status: 'pending',
}
]);

db.tasks.find({
    $and: [
        {
            priority: 1,
        },
        {
            status: 'pending',
        }
    ]
});

// or
db.tasks.insertMany([
{
  name: 'Task 1',
  priority: 1,
  status: 'pending',
},
{
  name: 'Task 2',
  priority: 1,
  status: 'completed',
},
{
  name: 'Task 3',
  priority: 2,
  status: 'pending',
}
]);

db.tasks.find({
    $or: [
        {
            priority: 1,
        },
        {
            status: 'pending',
        }
    ]
});

// exist
db.tasks.insertMany([
{
      name: 'Task 1',
	    priority: 1,
},
{
      name: 'Task 2',
      status: 'pending',
}
]);

db.tasks.find({
    priority: {
        $exist: true
    }
});

// specific fields

db.tasks.insertMany([
{
  name: 'Task 1',
  priority: 1
},
{
  name: 'Task 2',
  priority: 2
}
]);

db.tasks.find({}, {name: 1});

// sort
db.tasks.insertMany([
{
  name: 'Task 1',
  priority: 1
},
{
  name: 'Task 2',
  priority: 2
}
]);

db.tasks.find().sort({priority: -1});


// update

db.dropDatabase()

db.tasks.insertOne({
  name: "Learn MongoDB Topic 1",
  date: new Date(),
  priority: 1,
  status: "pending",
  user: "onkar",
  assignee: "onkar"
});

db.tasks.updateOne({
   _id: ObjectId("60f7d855b307d94301b9cb90")
}, {
       $set: {
       status: "completed"
   }
});

// update many
db.tasks.updateMany({
  _id: {
      $in: [
          ObjectId("60f7d855b307d94301b9cb90"), 
          ObjectId("60f7d855b307d94301b9cb91")
      ]
  }
}, 
{
  $set: {
      status: "completed"
  }
});

db.tasks.updateOne({
  name: "Learn MongoDB Topic 1"
}, 
{
  $set: {
      priority: 2
  }
});

db.tasks.deleteOne({
      _id: ObjectId("60f7d855b307d94301b9cb90")
});

db.tasks.deleteMany({
  _id: {
      $in: [
        ObjectId("60f7d855b307d94301b9cb90"), 
        ObjectId("60f7d855b307d94301b9cb91")
      ]
  }
});

