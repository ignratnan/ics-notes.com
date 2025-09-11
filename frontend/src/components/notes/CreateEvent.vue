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
                            NOTES <font-awesome-icon icon="angle-right" />
                            CREATE-EVENT
                        </h1>
                        <hr>
                    </div>
                    <form>
                        <div class="mt-4 mb-4">
                            <label for="title" class="block text-gray-700 text-sm font-bold my-2">
                                Event
                            </label>
                            <input type="text"
                                class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                                id="title" placeholder="Enter Event Name">
                        </div>
                        <div class="bg-gray-50 px-4 py-3 sm:px-6 sm:flex sm:flex-row-reverse">
                                <span class="flex w-full rounded-md shadow-sm sm:ml-3 sm:w-auto">
                                    <button type="button"
                                        class="inline-flex justify-center w-full rounded-md border border-transparent px-4 py-2 bg-green-600 text-base leading-6 font-medium text-white shadow-sm hover:bg-green-500 focus:outline-none focus:border-green-700 focus:shadow-outline-green transition ease-in-out duration-150 sm:text-sm sm:leading-5">
                                        Save
                                    </button>
                                </span>
                                <a href="/notes/create-note">
                                    <span class="mt-3 flex w-full rounded-md shadow-sm sm:mt-0 sm:w-auto">
                                        <button type="button"
                                            class="inline-flex justify-center w-full rounded-md border border-gray-300 px-4 py-2 bg-white text-base leading-6 font-medium text-gray-700 shadow-sm hover:text-gray-500 focus:outline-none focus:border-blue-300 focus:shadow-outline-blue transition ease-in-out duration-150 sm:text-sm sm:leading-5">
                                            Cancel
                                        </button>
                                    </span>
                                </a>
                            </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
import Sidebar from '@/components/layout/Sidebar.vue'
import SidebarBlock from '@/components/layout/SidebarBlock.vue'
</script>