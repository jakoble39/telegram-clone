<template>
  <div class="bg-gray-950 min-h-screen">
    <ul>
      <li
        class="box-border h-14 p-2 hover:bg-gray-900"
        v-for="chat in chats"
        v-bind:key="chat.id"
      >
        <ChatItem :chat="chat" />
      </li>
    </ul>
  </div>
</template>

<script setup>
import ChatItem from "./ChatItem.vue";

const chats = [
  {
    id: 1,
    avatar: "https://pbs.twimg.com/media/EIH4D68XkAA7v0K.jpg",
    title: "Joker",
    lastMessage: {
      text: "Haha",
      readAt: Date.now(),
      sentAt: Date.now(),
      fromUserId: 1,
    },
    unreadCount: 0,
  },
  {
    id: 2,
    avatar: "",
    title: "Your Mom",
    lastMessage: {
      text: "Lul",
      status: "sent",
      readAt: null,
      sentAt: Date.now(),
      fromUserId: 2,
    },
    unreadCount: 1,
  },
];
</script>
