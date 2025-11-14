<script setup>
import Sidebar from '@/components/layout/Sidebar.vue'
import SidebarBlock from '@/components/layout/SidebarBlock.vue'
</script>

<template>
  <div class="flex flex-row">
    <div>
      <SidebarBlock />
      <Sidebar />
    </div>
    <div class="w-full">
      <div class="py-1">
          <div class="mx-auto sm:px-6 lg:px-8">
              <div name="header" class="mt-2 p-2">
                  <h1 class="font-bold text-xl text-gray-800">
                      CHANGE PASSWORD
                  </h1>
                  <hr>
              </div>
              <div class="bg-black py-3">
                <form action="" class="bg-white">
                  <label for="email" class="border 1px w-100">Email:</label><br>
                  <select name="email" id="email">
                    <option value="">opt 1</option>
                    <option value="">opt 2</option>
                  </select>
                </form>
              </div>
              
          </div>
      </div>
    </div>
  </div>
</template>

<style scoped></style>