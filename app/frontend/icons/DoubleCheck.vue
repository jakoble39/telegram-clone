<template>
  <svg
    :style="{ height: size }"
    class="first"
    viewBox="0 0 1024 1024"
    xmlns="http://www.w3.org/2000/svg"
    data-v-ea893728=""
  >
    <path
      fill="currentColor"
      d="M406.656 706.944 195.84 496.256a32 32 0 1 0-45.248 45.248l256 256 512-512a32 32 0 0 0-45.248-45.248L406.592 706.944z"
    ></path>
  </svg>
  <svg
    :style="{ height: size, opacity: read ? 1 : 0 }"
    class="second"
    viewBox="0 0 1024 1024"
    xmlns="http://www.w3.org/2000/svg"
    data-v-ea893728=""
  >
    <path
      fill="currentColor"
      d="M406.656 706.944 195.84 496.256a32 32 0 1 0-45.248 45.248l256 256 512-512a32 32 0 0 0-45.248-45.248L406.592 706.944z"
    ></path>
  </svg>
</template>

<script setup>
import { defineProps } from "vue";

defineProps({
  size: {
    type: String,
    default: "1rem",
  },
  read: {
    type: Boolean,
    default: false,
  },
});
</script>

<style lang="scss">
.second {
  position: absolute;
  top: 0;
  left: 5px;
  transform-origin: center;
}
</style>
