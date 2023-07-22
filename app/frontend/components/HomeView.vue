<template>
  <div>
    <el-container>
      <el-aside width="70px"><NavSidebar /></el-aside>
      <el-aside width="400px"><ChatSidebar /></el-aside>
      <ChatView :chat="currentChat" />
    </el-container>
  </div>
</template>

<script setup>
import NavSidebar from "./NavSidebar.vue";
import ChatSidebar from "./ChatSidebar.vue";
import ChatView from "./ChatView.vue";

const currentChat = {
  id: 1,
  user: {
    id: 1,
    avatar: "https://pbs.twimg.com/media/EIH4D68XkAA7v0K.jpg",
    name: "Joker",
    status: "offline",
    lastSeen: Date.now(),
  },
  messages: [
    {
      id: 1,
      text: "Haha",
      readAt: null,
      sentAt: Date.now(),
      fromUser: {
        id: 1,
        avatar: "https://pbs.twimg.com/media/EIH4D68XkAA7v0K.jpg",
        name: "Joker",
      },
    },
    {
      id: 2,
      text: "Lul",
      status: "sent",
      readAt: Date.now(),
      sentAt: Date.now(),
      fromUser: {
        id: 3,
        avatar: "",
        name: "Me",
      },
    },
  ],
};
</script>
