// https://stackoverflow.com/questions/1349404/generate-random-string-characters-in-javascript
function makeid(length) {
  var result           = '';
  var characters       = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
  var charactersLength = characters.length;
  for ( var i = 0; i < length; i++ ) {
    result += characters.charAt(
      Math.floor(Math.random() * charactersLength)
    );
  }
  return result;
}

const dbName = "theeye-docs"

const conn = new Mongo()
const db = conn.getDB(dbName)

db.dropDatabase()

db.gw_user.insert({
  "enabled" : true,
  "invitation_token" : "",
  "devices" : [],
  "onboardingCompleted" : true,
  "_type" : "UiUser",
  "email" : "root@custom.domain.com",
  "username" : "root",
  "credential" : "root",
  "name" : "root user",
  "creation_date" : new Date(),
  "last_update" : null
})

db.customers.insert({
  "name" : "theeye",
  "display_name" : "TheEye",
  "config" : {
    "elasticsearch" : {
      "enabled" : false,
      "url" : ""
    },
    "kibana" : {
      "enabled" : false,
      "url" : ""
    },
    "remote_logger" : {
      "enabled" : false,
      "url" : "http://127.0.0.1:8001/theeye/%topic%/%date%"
    }
  },
  "agent" : null,
  "description" : "Root Organization",
  "creation_date" : new Date(),
  "last_update" : null
})

const user = db.gw_user.findOne({ username: 'root' })
db.gw_passport.insert({
  "protocol" : "local",
  "password" : "$2a$10$KH4LNwQNwBaazV018qIYFum6KON.tmJxe9c2Dhbm9NXADN8uPwEx2", // 12345678
  "user" : user._id,
  "user_id" : user._id,
  "provider" : "theeye",
  "creation_date" : new Date(),
  "last_update" : new Date(),
  "last_access" : null,
  "last_login" : null
})

const customer = db.customers.findOne({ name: 'theeye' })
db.gw_members.insert({
  "credential" : "root",
  "creation_date" : new Date(),
  "last_update" : null,
  "user" : user._id,
  "user_id" : user._id,
  "customer" : customer._id,
  "customer_id" : customer._id,
  "customer_name" : customer.name,
  "notifications" : {
    "mute" : false,
    "push" : false,
    "email" : false,
    "desktop" : false,
    "notificationFilters" : []
  },
})

// creating agent bot user.

db.gw_user.insert({
  "enabled" : true,
  "invitation_token" : null,
  "devices" : null,
  "onboardingCompleted" : true,
  "_type" : "BotUser",
  "username" : customer.name + "+agent",
  "email" : customer.name + "+agent@custom.domain.com",
  "name" : customer.name + " agent",
  "creation_date" : new Date(),
  "last_update" : new Date(),
  "credential" : "agent"
})

const agent = db.gw_user.findOne({ credential: 'agent' })
db.gw_members.insert({
  "credential" : "agent",
  "creation_date" : new Date(),
  "last_update" : null,
  "user" : agent._id,
  "user_id" : agent._id,
  "customer" : customer._id,
  "customer_id" : customer._id,
  "customer_name" : customer.name
})

db.gw_passport.insert({
  "protocol" : "local",
  "provider" : "theeye",
  "password" : null,
  "identifier" : makeid(64),
  "tokens" : {
    "access_token" : makeid(64),
    "refresh_token" : makeid(64)
  },
  "user" : agent._id,
  "user_id" : agent._id,
  "creation_date" : new Date(),
  "last_update" : new Date(),
  "last_access" : null,
  "last_login" : null
})

