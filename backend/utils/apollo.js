const ApolloClient = require("apollo-boost").ApolloClient;
const InMemoryCache = require("apollo-cache-inmemory").InMemoryCache;
const createHttpLink = require("apollo-link-http").createHttpLink;
const fetch = require("cross-fetch/polyfill").fetch;

const apollo_client = new ApolloClient({
  link: createHttpLink({
    uri: process.env.HASURA_GRAPHQL_URL,
    fetch: fetch,
    headers: {
      "content-type": "application/json",
      "x-hasura-admin-secret":
        "JRH60X2YB8srVXuiNYtNKvClhV6vYoVQtbG7aasuCOYGU34VhZtSOQtEM3Aalx42",
    },
  }),
  cache: new InMemoryCache(),
});

module.exports = apollo_client;
