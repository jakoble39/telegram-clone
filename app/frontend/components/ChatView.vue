<template>
  <div class="flex flex-col w-full">
    <div class="header flex justify-between w-full">
      <div class="user-info flex flex-col bg-sky-950 w-full p-3">
        <span class="text-sm font-semibold">{{ chat.user.name }}</span>
        <span class="text-xs text-gray-500">{{ statusString(chat.user) }}</span>
      </div>
      <div class="actions">
        <!-- Placeholder -->
      </div>
    </div>
    <div class="messages p-3 flex flex-col-reverse h-full">
      <div
        class="message flex mt-2"
        v-for="message in chat.messages"
        v-bind:key="message.id"
      >
        <div class="avatar">
          <el-image
            fit="scale-down"
            class="rounded-full w-10 h-full"
            :src="message.fromUser.avatar"
          >
            <template #error>
              <div
                class="bg-amber-700 w-10 h-full flex justify-center items-center"
              >
                <span>{{ message.fromUser.name[0] }}</span>
              </div>
            </template>
          </el-image>
        </div>
        <div
          class="message-content flex w-fit justify-between bg-gray-950 p-2 rounded-full ml-2"
        >
          <div class="text">
            <span class="text-xs">{{ message.text }}</span>
          </div>
          <div class="message-status pl-4">
            <span class="text-xs">{{ formatDate(message.sentAt) }}</span>
            <el-icon v-if="message.fromUser.id === 3" class="ml-1">
              <DoubleCheck :read="!!message.readAt" />
            </el-icon>
          </div>
        </div>
      </div>
    </div>
    <div class="footer h-fit">
      <el-form @submit="sendMessage">
        <el-form-item>
          <el-input v-model="message" placeholder="Type a message..." />
        </el-form-item>
      </el-form>
    </div>
  </div>
</template>

<script setup>
import { formatDate } from "@/helpers/utils";
import DoubleCheck from "@/icons/DoubleCheck.vue";
import { ref } from "vue";

defineProps({
  chat: {
    type: Object,
    required: true,
  },
});

const message = ref("");

const sendMessage = (e) => {
  e.preventDefault();
  console.log(message.value);
  message.value = "";
};

const statusString = (user) => {
  if (user.status === "online") {
    return "Online";
  } else if (user.status === "offline") {
    return `Last seen ${formatDate(user.lastSeen)}`;
  }
};
</script>
