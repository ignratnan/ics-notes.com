<script setup>
import Sidebar from '@/views/user/layout/Sidebar.vue'
import SidebarBlock from '@/views/user/layout/SidebarBlock.vue'
import NotesContent from '@/views/user/notes/NotesContent.vue'
</script>

<template>
  <div class="flex flex-row">
    <div>
      <SidebarBlock />
      <Sidebar />
    </div>
    <div class="w-full">
      <NotesContent />
    </div>
  </div>
</template>

<style scoped></style>
