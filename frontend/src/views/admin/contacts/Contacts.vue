<script setup>
import Sidebar from '@/views/admin/layout/Sidebar.vue'
import SidebarBlock from '@/views/admin/layout/SidebarBlock.vue'
import ContactsContent from '@/views/admin/contacts/ContactsContent.vue'
</script>

<template>
  <div class="flex flex-row">
    <div>
      <SidebarBlock />
      <Sidebar />
    </div>
    <div class="w-full">
      <ContactsContent />
    </div>
  </div>
</template>

<style scoped></style>