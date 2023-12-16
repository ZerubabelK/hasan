const { gql } = require("graphql-tag");
const apollo_client = require("../utils/apollo");
const jwt = require("jsonwebtoken");
const bcrypt = require("bcrypt");

const signupHandler = async (req, res) => {
  var credentials = req.body.input.params;
  credentials.password = await bcrypt.hash(credentials.password, 12);


  variables = {
    data: {...credentials,role:"user"},
  };
  console.log(variables,credentials);

  let data = await apollo_client.mutate({
    mutation: gql`
      mutation insertuser($data: users_insert_input!) {
        insert_users_one(object: $data) {
          email
          id
          phone_number
          name
        }
      }
    `,
    variables: variables,
  });

  console.log(data);

  payload = {
    "https://hasura.io/jwt/claims": {
      "x-hasura-allowed-roles": ["admin", "user"],
      "x-hasura-default-role": "user",
      "x-hasura-user-id": data.data.insert_users_one.id,
    },
  };

  //   console.log(payload);
  const token = jwt.sign(payload, process.env.JWT_KEY, {
    algorithm: "HS256",
    expiresIn: "1hr",
  });

  return res.json({
    token,
    id: data.data.insert_Users_one.id,
    email: data.data.insert_Users_one.email,
    user_name: data.data.insert_Users_one.user_name,
    password: data.data.insert_Users_one.password,
  });
};

module.exports = signupHandler;
