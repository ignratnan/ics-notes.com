<script setup>
import Sidebar from '@/views/admin/layout/Sidebar.vue'
import SidebarBlock from '@/views/admin/layout/SidebarBlock.vue'
import NotesContent from '@/views/admin/notes/NotesContent.vue'
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
