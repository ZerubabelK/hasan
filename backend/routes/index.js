// routes.js
const express = require('express');
const router = express.Router();
const login = require('../handlers/login.js');
const signup = require('../handlers/signup.js');

// Route to get Node.js version
router.post('/login', login);
router.post('/signup', signup);

module.exports = router;