const { gql } = require("graphql-tag");
const apollo_client = require("../utils/apollo");
const jwt = require("jsonwebtoken");
const bcrypt = require("bcrypt");

const loginHandler = async (req, res) => {
  // get request input
  const credentials  = req.body.input.params;


  const email = credentials.email;
  console.log(email);
  let GET_USER = gql`
    query ($email: String!) {
      users(where: { email: { _eq: $email } }) {
        id
        email
        name
        role
        password
      }
    }
  `;

  let data = await apollo_client.query({
    query: GET_USER,
    variables: { email },
  });

  let user = data.data.users[0];

  if (!user) {
    return res.json({
      message:"success",
      token: "",
    });
  }

  const isValidPassword = await bcrypt.compare(
    credentials.password,
    user.password
  );
  if (!isValidPassword) {
    return res.json({
      message:"success",
      token: "",
    });
  }
  
  payload = {
    "https://hasura.io/jwt/claims": {
      "x-hasura-allowed-roles": ["admin", "user"],
      "x-hasura-default-role": "user",
      "x-hasura-user-id": user.id,
    },
    metadata: {
      "x-hasura-allowed-roles": [user.role],
      "x-hasura-default-role": "user",
      "x-hasura-user-id": user.id,
      "user_data":{
        "name":user.name,
        "email":user.email,
        "phone_number":user.phone_number,
      }
      
    },
  };
  const token = jwt.sign(payload, process.env.JWT_KEY, {
    algorithm: "HS256",
    expiresIn: Date.now() + 1 * 24 * 60 * 60 * 1000,
  });

  // success
  return res.json({
    message:"success",
    token: token,
  });
};

module.exports = loginHandler;