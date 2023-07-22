<template>
  <div class="flex flex-row h-full cursor-pointer">
    <div class="avatar w-10 h-full rounded-full bg-white">
      <el-image
        fit="scale-down"
        class="rounded-full w-10 h-full"
        :src="chat.avatar"
      >
        <template #error>
          <div
            class="bg-amber-700 w-10 h-full flex justify-center items-center"
          >
            <span>{{ chat.title[0] }}</span>
          </div>
        </template>
      </el-image>
    </div>
    <div class="flex flex-col w-full h-full pl-2">
      <div class="flex justify-between h-full">
        <span class="text-sm font-semibold">{{ chat.title }}</span>
        <div>
          <el-icon v-if="chat.lastMessage.fromUserId !== 3" class="mr-1">
            <DoubleCheck :read="!!chat.lastMessage.readAt" />
          </el-icon>
          <span class="text-xs">{{ formatDate(chat.lastMessage.sentAt) }}</span>
        </div>
      </div>
      <div class="flex justify-between h-full">
        <span class="text-xs">{{ chat.lastMessage.text }}</span>
        <span
          v-if="chat.unreadCount"
          class="text-xs bg-cyan-950 rounded-full w-5 text-center"
          >{{ chat.unreadCount }}</span
        >
      </div>
    </div>
  </div>
</template>

<script setup>
import { formatDate } from "@/helpers/utils";
import DoubleCheck from "@/icons/DoubleCheck.vue";

defineProps({
  chat: {
    type: Object,
    required: true,
  },
});
</script>
