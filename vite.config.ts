import { defineConfig } from 'vite'
import ViteRubyPlugin from 'vite-plugin-rails'
import vue from '@vitejs/plugin-vue'

export default defineConfig({
  plugins: [
      vue(),
      ViteRubyPlugin(),
  ],
})
