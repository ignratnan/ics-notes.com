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
                            CONTACTS <font-awesome-icon icon="angle-right" />
                            CREATE-CONTACT
                        </h1>
                        <hr>
                    </div>
                    <form>
                        <div class="bg-white px-4 pt-5 pb-4 sm:p-6 sm:pb-4">
                            <label for="company_id"
                                class="block text-gray-700 text-sm font-bold my-2">
                                Company
                            </label>
                            <div class="flex flex-row">
                                <select
                                    class="w-full bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-black focus:border-black p-2.5 dark:text-black dark:focus:ring-black dark:focus:border-black">
                                    <option value=0 selected>Select Company</option>
                                    <option value="">Company name</option>
                                </select>
                            </div>
                            <div class="mt-4 mb-4">
                                <label for="contact_gender" class="block text-gray-700 text-sm font-bold my-2">
                                    Gender
                                </label>
                                <select wire:model="contact_gender" placeholder="Choose Agent Type"
                                    class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-black focus:border-black block w-full p-2.5 dark:text-black dark:focus:ring-black dark:focus:border-black">
                                    <option value="" selected disabled>Select Option</option>
                                    <option value="Mr.">Mr. </option>
                                    <option value="Mrs.">Mrs. </option>
                                    <option value="Ms.">Ms. </option>
                                </select>
                            </div>
                            <div class="mt-4 mb-4">
                                <label for="first_name" class="block text-gray-700 text-sm font-bold my-2">
                                    First Name
                                </label>
                                <input type="text"
                                    class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                                    id="first_name" placeholder="Enter First Name" wire:model="first_name">
                            </div>
                            <div class="mt-4 mb-4">
                                <label for="last_name" class="block text-gray-700 text-sm font-bold my-2">
                                    Last Name
                                </label>
                                <input type="text"
                                    class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                                    id="last_name" placeholder="Enter Last Name" wire:model="last_name">
                            </div>
                            <div class="mb-4">
                                <label for="title" class="block text-gray-700 text-sm font-bold my-2">
                                    Title
                                </label>
                                <input type="text"
                                    class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                                    id="title" placeholder="Enter Title" wire:model="title">
                            </div>
                            <div class="mb-4">
                                <label for="phone_number" class="block text-gray-700 text-sm font-bold my-2">
                                    Phone Number
                                </label>
                                <input type="tel"
                                    class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                                    id="phone_number" placeholder="Enter Phone Number" wire:model="phone_number">
                            </div>
                            <div class="mb-4">
                                <label for="email" class="block text-gray-700 text-sm font-bold my-2">
                                    Email
                                </label>
                                <input type="text"
                                    class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                                    id="email" placeholder="Enter Email" wire:model="email">
                            </div>

                            <div class="bg-gray-50 px-4 py-3 sm:px-6 sm:flex sm:flex-row-reverse">
                                <span class="flex w-full rounded-md shadow-sm sm:ml-3 sm:w-auto">
                                    <button type="button"
                                        class="inline-flex justify-center w-full rounded-md border border-transparent px-4 py-2 bg-green-600 text-base leading-6 font-medium text-white shadow-sm hover:bg-green-500 focus:outline-none focus:border-green-700 focus:shadow-outline-green transition ease-in-out duration-150 sm:text-sm sm:leading-5">
                                        Save
                                    </button>
                                </span>
                                <a href="/contacts">
                                    <span class="mt-3 flex w-full rounded-md shadow-sm sm:mt-0 sm:w-auto">
                                        <button type="button"
                                            class="inline-flex justify-center w-full rounded-md border border-gray-300 px-4 py-2 bg-white text-base leading-6 font-medium text-gray-700 shadow-sm hover:text-gray-500 focus:outline-none focus:border-blue-300 focus:shadow-outline-blue transition ease-in-out duration-150 sm:text-sm sm:leading-5">
                                            Cancel
                                        </button>
                                    </span>
                                </a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
import Sidebar from '@/views/admin/layout/Sidebar.vue'
import SidebarBlock from '@/views/admin/layout/SidebarBlock.vue'
</script>