<script setup>
import Sidebar from '@/components/layout/Sidebar.vue'
import SidebarBlock from '@/components/layout/SidebarBlock.vue'
import EventsContent from '@/components/events/EventsContent.vue'
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