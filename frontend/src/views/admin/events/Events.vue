<script setup>
import Sidebar from '@/views/admin/layout/Sidebar.vue'
import SidebarBlock from '@/views/admin/layout/SidebarBlock.vue'
import EventsContent from '@/views/admin/events/EventsContent.vue'
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