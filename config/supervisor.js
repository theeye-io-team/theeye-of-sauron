/**
 * replace here the default configuration values for your
 * local development environment
 */
module.exports = {
  //server: {},
  system: {
    base_url: "http://theeye-supervisor:60080",
    secret: 'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb',
  },
  //agent: {},
  storage: {
    driver: "local"
  },
  mongo: {
    debug: false,
    user: '',
    password: '',
    hosts: 'theeye-mongodb:27017',
    database: 'theeye-docs',
    // sample uri
    // uri: mongodb+srv://<user>:<password>@<host>/<db>?retryWrites=true&w=majority
    // options are passed directly to the mongo-native driver
    options: {
      useNewUrlParser: true,
      useUnifiedTopology: true
    }
  },
  monitor: {
    fails_count_alert: 1
  },
  mailer: {
    from: "%customer% TheEye.io <support@local.domain.com>"
  },
  //logger: {},
  notifications: {
    api: {
      secret: 'RRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR',
      url: 'http://theeye-gateway:6080/api/notification' // the same web server
    }
  },
  authentication: {
    secret: '66666666666666666666666666666666',
    protocol: 'http',
    api: {
      host: 'theeye-gateway',
      port: '6080'
    }
  },
  gateway: {
    secret: 'RRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR',
    member: {
      url: 'http://theeye-gateway:6080/api/internal/member/resolve'
    },
    user: {
      url: 'http://theeye-gateway:6080/api/internal/user/resolve'
    }
  },
  integrations: {
    // s3 integration
    aws: {
      enabled: true,
      config: {
        username: "",
        accessKeyId: "",
        secretAccessKey: "",
        region: ""
      },
      s3: {
        bucket: 'theeye-docs'
      }
    }
  }
}
