<template>
  <ul class="nav-items min-h-screen bg-gray-900">
    <li
      class="nav-item p-2 cursor-pointer"
      v-for="item in items"
      v-bind:key="item.id"
    >
      <div class="flex flex-col justify-center items-center">
        <el-icon size="30"><Component :is="item.icon" /></el-icon>
        <span class="text-xs">{{ item.text }}</span>
      </div>
    </li>
  </ul>
</template>

<script setup>
import { ChatDotRound } from "@element-plus/icons-vue";

const items = [{ id: 0, icon: ChatDotRound, text: "All Chats" }];
</script>
