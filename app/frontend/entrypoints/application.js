import { createApp } from 'vue'
import { createPinia } from 'pinia'
import { createRouter, createWebHistory } from 'vue-router'
import ElementPlus from 'element-plus'
import 'element-plus/dist/index.css'
import 'element-plus/theme-chalk/dark/css-vars.css'

import App from './App.vue'
import routes from './routes'

// Example: Load Rails libraries in Vite.
//
// import * as Turbo from '@hotwired/turbo'
// Turbo.start()
//
// import ActiveStorage from '@rails/activestorage'
// ActiveStorage.start()
//
// // Import all channels.
// const channels = import.meta.globEager('./**/*_channel.js')

import './application.scss'

const pinia = createPinia()
const router = createRouter({
  history: createWebHistory(),
  routes
})
const app = createApp(App)

app.use(pinia)
app.use(router)
app.use(ElementPlus)

app.mount('#app')
