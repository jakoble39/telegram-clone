<template>
  <section class="app-main">
    <router-view v-slot="{ Component }">
      <transition name="fade-transform" mode="out-in">
        <component :is="Component" />
      </transition>
    </router-view>
  </section>
</template>

<script setup>
import { useAuthStore } from "~/stores/useAuth"

const authStore = useAuthStore()

authStore.login("flameaxio@gmail.com", "abc123")
</script>

<style lang="scss">
.app-main {
  min-height: 100svh;
  position: relative;
  overflow: hidden;
}
</style>
