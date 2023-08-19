import {
  ApolloClient,
  createHttpLink,
  InMemoryCache,
} from "@apollo/client/core"
import { onError } from "@apollo/client/link/error"
import { useErrorsStore } from "~/stores/useErrors"
import { setContext } from "@apollo/client/link/context"

// HTTP connection to the API
const httpLink = createHttpLink({
  // You should use an absolute URL here
  uri: "http://127.0.0.1:3000/graphql",
  credentials: "include",
})

const errorHandler = onError(({ graphQLErrors }) => {
  if (graphQLErrors)
    useErrorsStore().$state = {
      message: graphQLErrors[0].message
    }
})

const authLink = setContext((_, { headers }) => {
  return {
    headers: {
      ...headers,
      authorization: localStorage.getItem("token"),
    },
  }
})

// Cache implementation
const cache = new InMemoryCache()

// Create the apollo client
const apolloClient = new ApolloClient({
  link: authLink.concat(errorHandler.concat(httpLink)),
  cache,
})

export default apolloClient