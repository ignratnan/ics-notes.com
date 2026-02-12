<script setup>
import Sidebar from '@/views/admin/layout/Sidebar.vue'
import SidebarBlock from '@/views/admin/layout/SidebarBlock.vue'
import DashboardContent from '@/views/admin/dashboard/DashboardContent.vue'
</script>

<template>
  <div class="flex flex-row">
    <div>
      
    </div>
    <div>
      <SidebarBlock />
      <Sidebar />
    </div>
    <div class="w-full">
      <DashboardContent />
    </div>
  </div>
</template>

<style scoped></style>