import { createApp } from "vue"
import { createPinia } from "pinia"
import { createRouter, createWebHistory } from "vue-router"
import ElementPlus from "element-plus"
import "element-plus/dist/index.css"
import "element-plus/theme-chalk/dark/css-vars.css"
import * as ElementPlusIconsVue from "@element-plus/icons-vue"
import VueApolloComponents from '@vue/apollo-components'
import apolloClient from "~/helpers/apollo"

import App from "./App.vue"
import routes from "./routes"

import "./application.scss"
import { createApolloProvider } from "@vue/apollo-option"

const pinia = createPinia()
const router = createRouter({
  history: createWebHistory(),
  routes,
})
const app = createApp(App)

// Load icons
for (const [key, component] of Object.entries(ElementPlusIconsVue)) {
  app.component(key, component)
}

const apolloProvider = createApolloProvider({
  defaultClient: apolloClient,
})

app.use(apolloProvider)
app.use(VueApolloComponents)
app.use(pinia)
app.use(router)
app.use(ElementPlus)

app.mount("#app")
