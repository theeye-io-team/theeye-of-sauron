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
  "email" : "root@theeye.io",
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
  "last_update" : null,
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

