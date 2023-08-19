import { defineStore } from 'pinia'
import apolloClient from "~/helpers/apollo"
import { gql } from "@apollo/client/core"

export const useAuthStore = defineStore('auth', {
  state: () => ({
    loggedIn: localStorage.getItem("loggedIn") ?? false,
    user: JSON.parse(localStorage.getItem("user")),
  }),
  actions: {
    async login(email, password) {
      const { login } = (
        await apolloClient.mutate({
          mutation: gql`mutation ($email: String!, $password: String!) {
              login(email: $email, password: $password) {
                   authToken,
                    user {
                        id,
                        email,
                        name,
                    }
              } 
          }`,
          variables: { email, password },
        })
      ).data

      if (!login) return

      localStorage.setItem("token", `Bearer ${login.authToken}`)
      localStorage.setItem("user", JSON.stringify(login.user))

      return login.user
    },
    async fetchUser() {
      const { currentUser } = (
        await apolloClient.query({
          query: gql`query {
              currentUser {
                  id,
                  email,
                  name,
              }
          }`,
        })
      ).data

      if (!currentUser) return

      localStorage.setItem("user", JSON.stringify(currentUser))

      return currentUser
    }
  }
}
)
