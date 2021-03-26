const argon2 = require('argon2')

const Argon2 = {
    hash(password) {
        return argon2.hash(password)
    }
}

module.exports = Argon2
