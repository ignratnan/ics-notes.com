<script setup>
import Sidebar from '@/views/user/layout/Sidebar.vue'
import SidebarBlock from '@/views/user/layout/SidebarBlock.vue'
import EventsContent from '@/views/user/events/EventsContent.vue'
</script>

<template>
  <div class="flex flex-row">
    <div>
      <SidebarBlock />
      <Sidebar />
    </div>
    <div class="w-full">
      <EventsContent />
    </div>
  </div>
</template>

<style scoped></style>